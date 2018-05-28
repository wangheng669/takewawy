<?php

namespace app\admin\controller;

use app\admin\common\Base;

class Stores extends Base
{
    public function index()
    {
        $stores=model('stores')->get(1);
        $stores['range_info']=$stores['range_info'];
        return $this->fetch('stores',[
            'stores'=>$stores,
        ]);
    }
    public function saveStores(){
        $post_data=request()->post();
        //将时间截取
        $time=explode(" - ",$post_data['time']);
        unset($post_data['time']);
        $post_data['start_time']=str_replace(":",'',$time[0]);
        $post_data['end_time']=str_replace(":",'',$time[1]);
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, 'http://apis.map.qq.com/ws/geocoder/v1/?address=' . $post_data['location'] . '&key=SIPBZ-AV2HJ-VB3FN-KQAZK-C4YM6-KYBS5');
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        $data = curl_exec($ch);
        $data = json_decode($data);
        $post_data['lng'] = $data->result->location->lng;
        $post_data['lat'] = $data->result->location->lat;

        model('stores')->allowField(true)->save($post_data,[
            'id'=>1
        ]);
        return $result_data=[
            'message'=>"保存成功",
            'status'=>2
        ];
    }
    function isPointInPolygon($lng,$lat)
    {
        $stores=model('stores')->get(1);
        $polygon=json_decode($stores['range_info']);
        $count = count($polygon);
        $px = $lng;
        $py = $lat;

        $flag = false;

        for ($i = 0, $j = $count - 1; $i < $count; $j = $i, $i++) {
            $sy = $polygon[$i]->lng;
            $sx = $polygon[$i]->lat;
            $ty = $polygon[$j]->lng;
            $tx = $polygon[$j]->lat;
        }
        return $flag;
    }
}
