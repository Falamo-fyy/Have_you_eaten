// pages/register/register.js
Page({
  data: {
      username: "",
      password: "",
      confirmPassword: ""
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

  // 监听确认密码输入
  onConfirmPasswordInput(e) {
      this.setData({
          confirmPassword: e.detail.value
      });
  },

  // 注册操作
  handleRegister() {
      const { username, password, confirmPassword } = this.data;

      if (password!== confirmPassword) {
          wx.showToast({
              title: "两次输入的密码不一致",
              icon: "none"
          });
          return;
      }

      // 发起注册请求到后端
      wx.request({
          url: 'http://127.0.0.1:3000/register', // 替换为实际后端地址
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
                  wx.showToast({
                      title: "注册成功",
                      icon: "success"
                  });
                  setTimeout(() => {
                        wx.switchTab({
                            url: '/pages/home/home'
                        });
                    }, 500);
              } else {
                  wx.showToast({
                      title: res.data.message,
                      icon: "none"
                  });
              }
          },
          fail: (err) => {
              console.error('注册请求失败: ', err);
              wx.showToast({
                  title: '网络请求失败，请稍后重试',
                  icon: "none"
              });
          }
      });
  },

  gohandleRegister(){
    wx.switchTab({
      url: '/pages/home/home',
    })
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad(options) {

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