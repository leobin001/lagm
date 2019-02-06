<?php
namespace Admin\Controller;
use Think\Controller;
class CategoryController extends Controller {

    public function index(){
        $this->display();
    }

    public function categoryData() {
        $categoryModel = M('category');
        $where = ['status' => 0];
        $total = $categoryModel->where($where)->count();
        $rows = [];
        if ($total) {
            $rows = $categoryModel->field('category_id,category_name,create_time,update_time')->where($where)->select();
            foreach ($rows as &$rowVal) {
                $rowVal['create_time'] = date('Y-m-d H:i:s', $rowVal['create_time']);
                $rowVal['update_time'] = date('Y-m-d H:i:s', $rowVal['update_time']);
                $rowVal['checkbox'] = "<input type=checkbox name='checkbox' value='" . base64_encode($rowVal['category_id']) . "'>";
                $rowVal['operate'] = "<div class='col-sm-1'><span data-id=" . base64_encode($rowVal['category_id']) . " class='glyphicon glyphicon-edit' title='编辑当前'></span></div>";
                $rowVal['operate'] .= "<div class='col-sm-1'><span data-id=" . base64_encode($rowVal['category_id']) . " class='glyphicon glyphicon-trash'  title='删除当前'></span></div>";
            }
        }
        $data = [
            'total' => $total ? $total : 0,
            'rows' => $rows,
        ];

        $this->ajaxReturn($data);
    }
}