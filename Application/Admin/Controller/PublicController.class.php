<?php
/**
 * Created by PhpStorm.
 * User: leo
 * Date: 2019/4/16
 * Time: 9:55
 */

namespace Admin\Controller;
use Think\Controller;

class PublicController extends Controller
{
    public function uploadImgByEditor(){
        $path = $_GET['path'];
        $data = ['errno'=>0];
        if (empty($_FILES) || empty($path)) {
            $data['code'] = -1;
            echo json_encode($data);exit();
        }
        //$dir = 'data/' . $path . "/";
        $dir = $path . "/";
        //$dir = func::simplifyDir($dir);
        $upload  = $this->fileUpload($_FILES['file'],['ext'=>'png|gif|jpg|','size'=>'2m'],$dir,true);
        //dump($upload);exit;
        if ($upload['url']) {
            echo 'http://'. $_SERVER['HTTP_HOST'] . '/' . $upload['url'];exit;
            //echo  config::$downloadUrl.$upload['url'];exit;
        } else {
            echo  "error|上传错误";exit;
        }

    }

    /**
     * 简单文件上传
     *
     * @param
     *            $file
     * @param $filter 过滤文件
     *            $filter array('ext'=>'文件后缀 txt|jpg|','size’=>'文件大小M')
     * @param $path 上传路径
     * @param $rename 是否重命名
     * @return array =>code 1、成功，2、大小错误 3、格式错误，4、上传失败 =>url 上传后文件路径
     *         add by yang
     */
    private function fileUpload($file, $filter, $path, $rename = true) {
        $result = array('code' => 1);
        if (is_uploaded_file($file['tmp_name'])) {
            if ($file['size'] > (int)$filter['size'] * 1000000) {
                $result['code'] = 2;
                // 文件大小错误
                return $result;
            }
            $ext = explode('|', $filter['ext']);
            $fileName = pathinfo($file['name']);
            $type = $fileName['extension'] ? $fileName['extension'] : $file['type'];
            if ($ext) {
                if (!in_array(strtolower($type), $ext)) {
                    $result['code'] = 3;
                    // 文件格式错误
                    return $result;
                }
            }
            if (!file_exists($path)) {
                @mkdir($path, 0777, true);
            }
            if($rename){
                $tempName = date('YmdHis') . mt_rand(0, 9999999);
                $fileName = $path . $tempName . '.' . $type;
            }else{
                $fileName = $path . $file['name'];
            }
            //          $fileName = iconv("UTF-8", "gb2312", $fileName);
            if (!move_uploaded_file($file['tmp_name'], $fileName)) {
                $result['code'] = 4;
                return $result;
            }
            //          $fileName = iconv("gb2312", "UTF-8", $fileName);
            $result['url'] = $fileName;
            return $result;
        }
    }
}