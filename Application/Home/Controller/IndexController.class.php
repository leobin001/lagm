<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends Controller {

    public function index(){
        $this->getCategoryList();
        $this->display();
        //$this->show('<style type="text/css">*{ padding: 0; margin: 0; } div{ padding: 4px 48px;} body{ background: #fff; font-family: "微软雅黑"; color: #333;font-size:24px} h1{ font-size: 100px; font-weight: normal; margin-bottom: 12px; } p{ line-height: 1.8em; font-size: 36px } a,a:hover{color:blue;}</style><div style="padding: 24px 48px;"> <h1>:)</h1><p>欢迎使用 <b>ThinkPHP</b>！</p><br/>版本 V{$Think.version}</div><script type="text/javascript" src="http://ad.topthink.com/Public/static/client.js"></script><thinkad id="ad_55e75dfae343f5a1"></thinkad><script type="text/javascript" src="http://tajs.qq.com/stats?sId=9347272" charset="UTF-8"></script>','utf-8');
    }

    public function articleList() {
        $categoryId = I('get.category_id');
        $articleList = M('article')->field('article_id, title, list_pic, read, like, update_time')->where(array('status'=>0, 'category_id'=>$categoryId))->select();
        foreach ($articleList as &$article) {
            $article['list_pic'] = 'http://'. $_SERVER['HTTP_HOST'] . '/' . $article['list_pic'];
        }
        $this->assign('articleList', $articleList);

        $this->getCategoryList();
        $this->display();
    }

    public function detail() {
        $this->getCategoryList();
        $this->display();
    }

    /**
     * 获取目录列表
     */
    private function getCategoryList() {
        $categoryList = M('category')->field('category_id, category_name')->where(array('status'=>0, 'parent_id'=>0))->select();
        $this->assign('categoryList', $categoryList);
    }
}