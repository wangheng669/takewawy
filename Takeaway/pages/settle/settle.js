var start_price;
var start_distance;
var add_price;
var add_distance;
Page({
  data: {
    price:0
  },
  onLoad: function (options) {
    var price = parseInt(options.price);
    var distance = options.distance;
    this.getPrDi(price,distance);
  },
  //计算配送费以及免配送费的距离
  getPrDi: function (price, distance){
    var that=this;
    wx.request({
      url: 'http://127.0.0.1/admin/dish/api',
      method: 'GET',
      success: function (res) {
        start_price = res.data[2].start_price;
        start_distance = res.data[2].start_distance;
        add_price=res.data[2].add_price;
        add_distance = res.data[2].add_distance;
        if(distance <= start_distance) {
            that.setData({
              price:price,
            })
        } else {
          price+=Math.floor(Math.floor(distance - start_distance)/add_distance * add_price);
        }
        that.setData({
          price: price,
        })
      }
    })
  }
})