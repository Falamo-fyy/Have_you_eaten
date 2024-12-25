// pages/shoplist/shoplist.js

// 图片请求
const tableColumnConfig = [
  // { table: 'shoplist', column: 'icon' },
  // { table: 'fenlei', column: 'icon' },
];
const app = getApp()
Page({

  /**
   * 页面的初始数据
   */
  data: {
    query: {},
    pageSize:10,
    total:0,
    shopList:[],
    shopicon:{}
  },
  // 点击事件处理函数
  goToShopDetail(e) {
    const shopId = e.currentTarget.dataset.id; // 获取 ID
    wx.navigateTo({
      url: `/pages/shopdetail/shopdetail?id=${shopId}` // 跳转到详情页，携带 ID 参数
    });
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad(options) {
    this.setData({
      query:options,
      cartItems:app.globalData.cartItems,
      cartTotal:app.globalData.cartTotal,
    })
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
  },


  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady() {
    wx.setNavigationBarTitle({
      // 传递按钮参数
      title: this.data.query.name,
    })

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
    this.setData({
      shopList:[]
    })
    this.feuckData(()=>{
      wx.stopPullDownRefresh()
    });

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom() {
    // this.setData({
    //   page:this.data.page+1
    // })

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage() {

  }
})