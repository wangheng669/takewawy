//我的key
var mykey ="SIPBZ-AV2HJ-VB3FN-KQAZK-C4YM6-KYBS5";
//商家经度
var store_lat;
//商家纬度
var store_lng;
//商家配送范围
var end_distance;
Page({
  data: {
    price:0,
    toView: 'inToView01',
    good:[],
    count:0,
    location:"请选择位置",
    start_price:0,
    stores_location:"",
    start_time:0,
    end_time:0,
    now_time:0,
    now_distance:0,
  },
  onLoad:function(){
    var that=this;
    wx.request({
      url: 'http://127.0.0.1/admin/dish/api',
      method: 'GET',
      success: function(res) {
        that.setData({
          "dish_data":res.data[0],
          "category_data": res.data[1],
          start_price:res.data[2].start_price,
          stores_location:res.data[2].location,
          start_time: res.data[2].start_time,
          end_time: res.data[2].end_time,
        })
        store_lat = res.data[2].lat;
        store_lng = res.data[2].lng;
        end_distance=res.data[2].end_distance;
      },
    })
    this.setData({
      now_time: this.formatTime()
    });
  },
  //获取当前时间
  formatTime:function() {
    var date=new Date();
    var hour = date.getHours()
    var minute = date.getMinutes()
    var second = date.getSeconds()
    return hour+''+minute+''+second;
  }
  ,
  //计算距离
  getDistance:function (lat1, lng1, lat2, lng2) {
    lat1 = lat1 || 0;
    lng1 = lng1 || 0;
    lat2 = lat2 || 0;
    lng2 = lng2 || 0;
    var rad1 = lat1 * Math.PI / 180.0;
    var rad2 = lat2 * Math.PI / 180.0;
    var a = rad1 - rad2;
    var b = lng1 * Math.PI / 180.0 - lng2 * Math.PI / 180.0;
    var r = 6378137;
    return (r * 2 * Math.asin(Math.sqrt(Math.pow(Math.sin(a / 2), 2) + Math.cos(rad1) * Math.cos(rad2) * Math.pow(Math.sin(b / 2), 2)))).toFixed(0)
  },
  //选择位置
  changeLocation: function (){
    var that = this;
    var point=new Array();
    var address="超出配送范围";
    var location;
    wx.chooseLocation({
      success: function (res) {
        point[0]=res.latitude;
        point[1]=res.longitude;
        location=res.address;
        wx:wx.request({
          url: 'http://127.0.0.1/admin/stores/isPointInPolygon',
          data:{
            point: point,
          },
          method:'POST',
          success: function(res) {
            console.log(res.data);
            if(res.data==1){
              address = location;
            }
            that.setData({
              location: address,
            })
          },
        })
        // if (end_distance<that.getDistance(res.latitude, res.longitude, store_lat, store_lng)){
        //   res.address="超出配送范围";
        // }
        // that.setData({
        //   location: res.address,
        //   now_distance:that.getDistance(res.latitude, res.longitude, store_lat, store_lng)
        // });
      },
    })
  },
  //点击添加
  addDish:function(event){
    var good = this.data.good;
    var count = good[event.currentTarget.dataset.id] == null ? 0 : good[event.currentTarget.dataset.id];
    var price = this.data.price;
    price += event.currentTarget.dataset.price;
    good[event.currentTarget.dataset.id] = ++count;
    this.setData({
      "good":good,
      "price": price,
      "count": ++this.data.count
    });
  },
  //点击减少
  delDish: function (event) {
    var good = this.data.good;
    var count = good[event.currentTarget.dataset.id];
    var price = this.data.price;
    price -= event.currentTarget.dataset.price;
    good[event.currentTarget.dataset.id] = --count;
    this.setData({
      "good": good,
      "price": price,
      "count": --this.data.count
    });
  },
  //锚点
  scrollToViewFn: function (e) {
    var _id = e.target.dataset.id;
    this.setData({
      toView: 'inToView' + _id
    })
  },
  //去结算
  settle:function(event){
    var that=this;
    var price = event.target.dataset.price;
    var distance = event.target.dataset.distance;
    console.log(distance);
    if (that.data.location =="请选择位置"){
      wx.showToast({
        title: '请选择位置',
        icon: 'none',
        duration: 2000
      })
    }else{
      wx.navigateTo({
        //配送位置 买的菜 数量 总价格 
        url: '../settle/settle?price='+price+'&distance='+distance,
      })
    }
  }
})  