// pages/home/home.js
const app = getApp()
Page({

  /**
   * 页面的初始数据
   */
  data: {
    isLoggedIn: false, // 登录状态
    userInfo: {}, // 用户信息
    username: "", // 输入框用户名
    password: "", // 输入框密码
  },

  // 监听用户名输入
  onUsernameInput(e) {
    this.setData({
      username: e.detail.value
    });
  },

  // 监听密码输入
  onPasswordInput(e) {
    this.setData({
      password: e.detail.value
    });
  },

  // 登录操作
  handleLogin() {
    const { username, password } = this.data;
    wx.request({
        url: 'http://127.0.0.1:3000/login', 
        method: 'POST',
        data: {
            username: username,
            password: password
        },
        header: {
            'Content-Type': 'application/json'
        },
        success: (res) => {
            if (res.data.success) {
                this.setData({
                    isLoggedIn: true,
                    userInfo: {
                        username: username,
                        avatar: "https://www.helloimg.com/i/2024/12/16/67603b55a202f.jpg" // 登录后用户头像
                    }
                });
                app.globalData.isLoggedIn=true;
                wx.showToast({
                    title: "登录成功",
                    icon: "success"
                });
            } else {
                wx.showToast({
                    title: '登陆失败',
                    icon: "none"
                });
            }
        },
        fail: (err) => {
            console.error('登录请求失败: ', err);
            wx.showToast({
                title: '网络请求失败，请稍后重试',
                icon: "none"
            });
        }
    });
  },

  // 注销操作
  handleLogout() {
    this.setData({
      isLoggedIn: false,
      userInfo: {}
    });
    app.globalData.isLoggedIn=false;
    wx.showToast({
      title: "已退出登录",
      icon: "success"
    });
  },

  // 注册操作
  handleRegister() {
    wx.showToast({
      title: "/pages/register/register",
      icon: "none"
    });
    wx.navigateTo({
      url: `/pages/register/register` 
    });
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad(options) {
    this.setData({
      isLoggedIn:app.globalData.isLoggedIn,
    })
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
    this.onLoad()
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