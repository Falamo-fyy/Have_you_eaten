// pages/goods/goods.js
const app = getApp()
Page({

  /**
   * 页面的初始数据
   */
  data: {
    cartItems: [], // 购物车商品列表
    cartTotal: 0,  // 总金额
    goodslist:[]
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad(options) {
    this.setData({
      cartItems: app.globalData.cartItems,
      cartTotal: app.globalData.cartTotal,
    });
    wx.request({
      url: 'http://127.0.0.1:3000/api/getCartData', // 替换为你的后端接口地址
      method: 'GET',
      success: (res) => {
        console.log('查询成功:', res.data);
        const cartData = res.data.cartData;
        console.log('购物车数据:', cartData);
        // 在这里处理获取的数据，比如更新页面显示
        // 解析返回的 cartItems 数据
        cartData.forEach(item => {
        item.cartItems = JSON.parse(item.cartItems); // 将 JSON 字符串解析为对象
        });
        this.setData({
          goodslist:cartData
        })
        console.log('解析后的购物车数据:', cartData);
      },
      fail: (err) => {
        console.error('查询失败:', err);
      }
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
    this.onLoad();
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