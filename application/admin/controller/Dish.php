<?php

namespace app\admin\controller;

use app\admin\common\Base;

class Dish extends Base
{
    public function index()
    {
        $dish_list=model('dish')->order('category_id')->select();
        $count=model('dish')->count();
        return $this->fetch('dish-list',[
            'dish_list'=>$dish_list,
            'count'=>$count,
        ]);
    }
    public function addDish()
    {
        //获取分类
        $category=model('category')->select();
        return $this->fetch('dish-add',[
            'category'=>$category,
        ]);
    }
    //修改
    public function editDish($id)
    {
        //获取分类
        $category = model('category')->select();
        $dish_edit=model('dish')->get($id);
        return $this->fetch('dish-edit',[
            'dish_edit'=>$dish_edit,
            'category'=>$category,
        ]);
    }
    //保存
    public function saveDish(){
        $post_data=request()->post();
        //判断id是否存在
        if(request()->post('id')){
            $result = model('dish')->save($post_data,['id' => $post_data['id']]);
            $result_data = [
                'status' => $result,
                'message' => '修改成功',
            ];
        }else{
            $result = model('dish')->save($post_data);
            $result_data = [
                'status' => $result,
                'message' => '添加成功',
            ];
        }
        return $result_data;
    }
    //删除
    public function deleteDish(){
        return $this->delete('dish');
    }
    //上传图片
    public function upload()
    {
        $message = '上传成功';
        $src     = '';
        $file    = request()->file('file');
        if (empty($file)) {
            $message = '图片上传失败';
        } else {
            //进行上传操作
            $map  = [
                'ext'  => 'jpg,png,gif',
                'size' => 3000000,
            ];
            $info = $file->validate($map)->move(ROOT_PATH . 'public/uploads');
            if (is_null($info)) {
                $message = '图片信息出错';
            }
            //获取图片名称
            $src = $info->getSaveName();
        }
        $result_data = [
            'message' => $message,
            'src'     => $src,
        ];
        return $result_data;
    }
    //小程序接口
    public function api()
    {
        $dish=model('dish')->order('category_id')->select();
        $category=model('category')->select();
        $stores=model('stores')->get(1);
        $result = array();
        $result[1]=$category;
        $result[2]=$stores;
        foreach ($dish as $k => $v) {
            $result[0][$v['category_id']][] = $v;
        }
        return json($result);
    }
}
