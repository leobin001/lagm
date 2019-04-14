<?php
namespace Admin\Controller;
use Think\Controller;
class CategoryController extends Controller {
    private $_model;
    public function __construct() {
        parent::__construct();
        $this->_model = M('category');
    }

    public function index(){
        $this->display();
    }

    public function categoryData() {
        $where = ['status' => 0];
        $total = $this->_model->where($where)->count();
        $rows = [];
        if ($total) {
            $rows = $this->_model->field('category_id,category_name,create_time,update_time')->where($where)->select();
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

    public function edit() {
        if (IS_POST) {
            $post = I('post.');
            if ($post['id']) {
                //修改
                $where = [
                    'category_id' => $post['id'],
                    'status' => 0
                ];
                $save = [
                    'category_name'=>$post['category_name'],
                    'update_time'=>time()
                ];
                $result = $this->_model->where($where)->save($save);
            } else {
                //新增
                $add = [
                    'category_name' => $post['category_name'],
                    'create_time' => time(),
                    'update_time' => time(),
                ];
                $result = $this->_model->add($add);
            }

            if ($result) {
                $this->ajaxReturn(['code' => 1001, 'msg' => '修改成功']);
            } else {
                $this->ajaxReturn(['code' => -1001, 'msg' => '修改失败']);
            }
        }

        if (I('get.id')) {
            $categoryId = base64_decode(I('get.id'));
            $row = $this->_model->field('category_id, category_name')->where(['category_id' => $categoryId])->find();
            //dump($row);exit;
            $this->assign('row', $row);
        }

        $this->display();
    }
}