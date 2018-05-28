<?php

namespace app\admin\controller;

use app\admin\common\Base;

class Category extends Base
{
    //列表
    public function index()
    {
        //获取列表数据
        $category_list=model("category")->select();
        $count=model("category")->count();
        return $this->fetch('category-list',[
            "category_list"=>$category_list,
            'count'=>$count,
        ]);
    }
    //添加
    public function addCategory()
    {
        return $this->fetch('category-add');
    }
    //修改
    public function editCategory($id)
    {
        $category_edit=model('category')->get($id);
        return $this->fetch('category-edit',[
            'category_edit'=>$category_edit,
        ]);
    }
    //保存
    public function saveCategory(){
        $post_data=request()->post();
        //判断id是否存在
        if(request()->post('id')){
            $result = model('category')->save($post_data,['id' => $post_data['id']]);
            $result_data = [
                'status' => $result,
                'message' => '修改成功',
            ];
        }else{
            $result = model('category')->save($post_data);
            $result_data = [
                'status' => $result,
                'message' => '添加成功',
            ];
        }
        return $result_data;
    }
    //删除
    public function deleteCategory(){
        return $this->delete('Category');
    }
}
