<?php
namespace app\admin\common;

use think\Controller;

class Base extends Controller
{
    //删除操作
    public function delete($model)
    {
        $status    = 0;
        $message   = '删除失败';
        $post_data = request()->post();
        if (!empty($post_data)) {
            $id = intval($post_data['id']);
            if (model($model)->destroy(['id' => $id])) {
                $status  = 2;
                $message = '删除成功';
            };
        }
        $data = [
            'status'  => $status,
            'message' => $message,
        ];
        return $data;
    }
}
