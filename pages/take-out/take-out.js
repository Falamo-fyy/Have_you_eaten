// pages/take-out/take-out.js

// // 图片请求设置
// const tableColumnConfig = [
//   { table: 'card', column: 'image' },
//   { table: 'fenlei', column: 'icon' },
//   { table: 'shoplist', column: 'icon' },
// ];
const app = getApp()
Page({

  /**
   * 页面的初始数据
   */
  data: {
    query: {name:'美食'},
    cardList:[],//卡片信息
    FenLeiList:[],//分类卡片信息
    imagesList: {} ,// 用于存储不同表的图片列表，按表名分类
    cartItems: [],
    cartTotal: 0,
  },
  goToShopDetail(e) {
    const shopId = e.currentTarget.dataset.id; // 获取 ID
    wx.navigateTo({
      url: `/pages/shopdetail/shopdetail?id=${shopId}` // 跳转到详情页，携带 ID 参数
    });
  },

  /**
   * 生命周期函数--监听页面加载
   */
  /**
     * 生命周期函数--监听页面加载
     */
    onLoad(options) {
      this.fetchData();
      this.setData({
        cartTotal:app.globalData.cartTotal,
        cartItems:app.globalData.cartItems,
      })
    
  },
  
  // 请求
  fetchData: function() {
    const self = this;
    wx.request({
      url: 'http://127.0.0.1:3000/', // 后端API接口地址
      method: 'GET',
      success: function(res) {
        if (res.statusCode === 200 && res.data) {
          self.setData({
            cardList: res.data // 将后端返回的数据存储到页面的data中
          });
        } else {
          console.error('数据请求失败', res);
        }
      },
      fail: function(err) {
        console.error('请求失败', err);
      }
    });

    wx.request({
      url: 'http://127.0.0.1:3000/FenLei', // 后端API接口地址
      method: 'GET',
      success: function(res) {
        if (res.statusCode === 200 && res.data) {
          self.setData({
            FenLeiList: res.data // 将后端返回的数据存储到页面的data中
          });
        } else {
          console.error('数据请求失败', res);
        }
      },
      fail: function(err) {
        console.error('请求失败', err);
      }
    });

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