<?php
namespace Admin\Controller;
use Think\Controller;
class ArticleController extends Controller {
    private $_model;
    public function __construct() {
        parent::__construct();
        $this->_model = M('article');
    }

    public function index(){
        $this->display();
    }

    public function articleData() {
        $where = ['status' => 0];
        $total = $this->_model->where($where)->count();
        $rows = [];
        if ($total) {
            $rows = $this->_model->alias('a')->field('a.article_id,b.category_name,a.category_id,a.title,a.read,a.like,a.update_time')->join('LEFT JOIN category as b on a.category_id = b.category_id')->where(['a.status' => 0])->select();
            foreach ($rows as &$rowVal) {
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
            $data = [
                'category_id'=>$post['category_id'],
                'title'=>$post['title'],
                'content' => $post['content'],
                'update_time'=>time()
            ];
            if ($post['id']) {
                //修改
                $where = [
                    'article_id' => $post['id'],
                    'status' => 0
                ];
                $result = $this->_model->where($where)->save($data);
            } else {
                //新增
                $data['create_time'] = time();
                $result = $this->_model->add($data);
            }

            if ($result) {
                $this->ajaxReturn(['code' => 1001, 'msg' => '修改成功']);
            } else {
                $this->ajaxReturn(['code' => -1001, 'msg' => '修改失败']);
            }
        }

        if (I('get.id')) {
            $articleId = base64_decode(I('get.id'));
            $row = $this->_model->field('article_id,category_id,title,content')->where(['category_id' => $articleId])->find();
            $row['content'] = htmlspecialchars_decode($row['content']);
            //dump($row);
            $this->assign('row', $row);
        }

        $categoryList = M('category')->field('category_id, category_name')->where(['parent_id' => 0,'status' => 0])->select();
        $this->assign('categoryList', $categoryList);

        $this->display();
    }
}