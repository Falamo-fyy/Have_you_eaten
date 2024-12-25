// pages/shopping cart/shopping cart.js
const app = getApp()
Page({

  /**
   * 页面的初始数据
   */
  data: {
    cartItems: [], // 购物车商品列表
    cartTotal: 0,  // 总金额
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad(options) {
    this.setData({
      cartItems: app.globalData.cartItems,
      cartTotal: 0
    });
    this.calculateTotal(); // 初始化计算总金额
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
    this.onLoad()//重复调用刷新页面
  },
  /**
   * 计算总金额
   */
  calculateTotal() {
    const total = this.data.cartItems.reduce((sum, item) => sum + item.quantity * item.price, 0);
    this.setData({
      cartTotal: total
    });
  },

  /**
   * 增加商品数量
   */
  increaseQuantity(e) {
    const index = e.currentTarget.dataset.index; // 获取商品索引
    const updatedItems = this.data.cartItems;
    updatedItems[index].quantity++; // 数量加1
    this.setData({
      cartItems: updatedItems
    });
    this.calculateTotal(); // 更新总金额
  },

  /**
   * 减少商品数量
   */
  decreaseQuantity(e) {
    const index = e.currentTarget.dataset.index; // 获取商品索引
    const updatedItems = this.data.cartItems;
    if (updatedItems[index].quantity > 1) {
      updatedItems[index].quantity--; // 数量减1
      this.setData({
        cartItems: updatedItems
      });
    }else{
      app.globalData.cartItems = app.globalData.cartItems.filter(item => item.id!== index);
      app.globalData.cartTotal -= updatedItems[index].price;
    }
    this.calculateTotal(); // 更新总金额
  },
  clear_footer() {
    this.setData({
      cartItems:[],
      cartTotal:0,
    });
    app.globalData.cartTotal = 0;
    app.globalData.cartItems = [];
    this.calculateTotal(); // 更新总金额
  },

  /**
   * 提交订单
   */
  submitOrder() {
    // console.log("提交的商品: ", this.data.cartItems);
    wx.showToast({
      title: "订单已提交",
      icon: "success",
    });
    app.globalData.cartTotal=this.data.cartTotal
    app.globalData.cartItems=this.data.cartItems

    wx.request({
      url: 'http://127.0.0.1:3000/api/uploadCart', // 替换成你的后端接口地址
      method: 'POST',
      header: {
        'content-type': 'application/json' // JSON数据
      },
      data: {
        cartItems: app.globalData.cartItems, // 任意结构相似的cartItems数组
        cartTotal: app.globalData.cartTotal  // 总价
      },
      success: (res) => {
        console.log('上传成功', res.data);
      },
      fail: (err) => {
        console.error('上传失败', err);
      }
    });

    wx.switchTab({
      url: '/pages/goods/goods',
    })
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