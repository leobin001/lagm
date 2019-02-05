<?php
namespace Admin\Controller;
use Think\Controller;
class IndexController extends Controller {
    public function login() {
        if (IS_POST) {
            $post = I('post.');
            $where = [
                'account' => $post['account'],
                'pwd' => md5($post['pwd'])
            ];
            $result = M('admin')->field('id')->where($where)->select();
            if($result) {
                $this->ajaxReturn(['code' => 1]);
            }
        }
        $this->display();
    }

    public function loginApi() {

    }

    public function index(){
        $this->display();
    }
}