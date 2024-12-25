// pages/shopdetail/shopdetail.js
const app = getApp()
Page({

  /**
   * 页面的初始数据
   */
  
  data: {
    query: {},
    shopList:[],
    cartModalShow: false,//控制模态框显示
    // showCartPopup: false,
    cartItems: [],//购物列表
    categories: [
      { name: '全部商品', products: [
          { id: 1, name: '红烧鲫鱼', price: 25, image: '' },
          { id: 2, name: '加多宝凉茶', price: 6, image: '' },
          { id: 3, name: '特色鸡肉卷', price: 30, image: '' }
        ]
      },
      { name: '特色商品', products: [
          { id: 3, name: '特色鸡肉卷', price: 30, image: '' }
        ]
      },
      { name: '热销商品', products: [
        { id: 1, name: '红烧鲫鱼套餐', price: 25, image: '' },
        { id: 2, name: '加多宝凉茶', price: 6, image: '' }
      ]
    },
    ],
    currentCategory: 0,//分类标签页？
    currentProducts: [],//商品
    cartTotal: 0 //商品总金额
  },

  goToShoppingCart() {
    wx.switchTab({
      url: '/pages/shopping_cart/shopping_cart'
    });
  },

  decreaseQuantity(e) {
    const productId = e.currentTarget.dataset.id;
    const product = app.globalData.cartItems.find(item => item.id === productId);
    if (product) {
        if (product.quantity > 1) {
            product.quantity--;
            app.globalData.cartTotal -= product.price;
        } else {
            // 当数量等于0时，从购物车中移除该商品
            app.globalData.cartItems = app.globalData.cartItems.filter(item => item.id!== productId);
            app.globalData.cartTotal -= product.price;
        }
        // 通过setData来更新购物车相关数据，触发页面重新渲染
        this.setData({
            cartTotal: app.globalData.cartTotal,
            cartItems: app.globalData.cartItems
        });
    }
},

  clearCart() {
    app.globalData.cartTotal = 0;
    app.globalData.cartItems = [];
    this.setData({
      cartModalShow: false,
      cartTotal:app.globalData.cartTotal
    });
  },

  viewCartItems() {
    // 处理购物车商品数据，合并相同商品
    const processedCartItems = [];
    app.globalData.cartItems.forEach(item => {
      const existingItem = processedCartItems.find(i => i.id === item.id);
      if (existingItem) {
        existingItem.quantity += item.quantity;
      } else {
        processedCartItems.push({...item, quantity: item.quantity });
      }
    });
    this.setData({
      cartModalShow: true,
      cartItems: processedCartItems,
      cartTotal:app.globalData.cartTotal
    });
  },

      closeCartModal() {
       this.setData({
        cartModalShow: false
    });
  },

  addToCart(e) {
    const productId = e.currentTarget.dataset.id;
    const product = this.data.currentProducts.find(item => item.id === productId);
    if (product) {
      // 检查购物车中是否已存在该商品
      const existingItem = app.globalData.cartItems.find(item => item.id === productId);
      if (existingItem) {
        // 如果存在，增加数量
        existingItem.quantity = (existingItem.quantity || 1) + 1;
        app.globalData.cartTotal += product.price;
      } else {
        // 如果不存在，添加到购物车并设置数量为1
        app.globalData.cartTotal += product.price;
        app.globalData.cartItems.push({...product, quantity: 1 });
      }
    }
    this.setData({
      cartItems:app.globalData.cartItems,
      cartTotal:app.globalData.cartTotal
    })
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad(options) {
    this.setData({ currentProducts: this.data.categories[0].products });
    this.setData({
      query:options,
      cartTotal:app.globalData.cartTotal
    }),
    this.feuckData();
  },

  // 请求
  feuckData: function(cb) {
    const self = this;
    //展示loading
    wx.showLoading({
      title: '加载列表中...',
    })
    wx.request({
      url: 'http://127.0.0.1:3000/ShopList', // 后端API接口地址
      method: 'GET',
      success: function(res) {
        if (res.statusCode === 200 && res.data) {
          self.setData({
            shopList: res.data // 将后端返回的数据存储到页面的data中
          });
        } else {
          console.error('数据请求失败', res);
        }
      },
      fail: function(err) {
        console.error('请求失败', err);
      },
      complete:() =>{
        //loading效果隐藏
        wx.hideLoading()
        // wx.stopPullDownRefresh()
        cb && cb()
      }

    });

    wx.request({
      url: 'http://127.0.0.1:3000/ShopListgoods', // 后端API接口地址
      method: 'GET',
      data: {
          shopId: this.data.query.id // 如果query.id不存在值，就使用默认值1传递给后端
      },
      success: function (res) {
          if (res.statusCode === 200 && res.data) {
              const categoriesMap = new Map();
              res.data.forEach(product => {
                  const categoryName = product.type;
                  if (!categoriesMap.has(categoryName)) {
                      categoriesMap.set(categoryName, {
                          name: categoryName,
                          products: []
                      });
                  }
                  categoriesMap.get(categoryName).products.push({
                      id: product.id,
                      name: product.name,
                      price: product.price,
                      image: product.picture,
                      sales:product.sale,
                      rating:product.haopinglv
                  });
              });
              const categoriesArray = Array.from(categoriesMap.values());
              self.setData({
                  categories: categoriesArray,
                  currentProducts: categoriesArray.length > 0? categoriesArray[0].products : []
              });
          } else {
              console.error('数据请求失败', res);
          }
      },
      fail: function (err) {
          console.error('请求失败', err);
      }
  });

  },

  
  // 切换商品分类
  switchCategory(e) {
    const index = e.currentTarget.dataset.index;
    this.setData({ 
      currentCategory: index,
      currentProducts: this.data.categories[index].products
    });
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady() {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow() {

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide() {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload() {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh() {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom() {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage() {

  }
})