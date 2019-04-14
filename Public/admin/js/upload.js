/**
 * webupload 上传
 */

/**
 * 上传
 * @param pdiv
 * @param vid
 * @param limit
 * @param baseUrl
 * @param server
 */
function createUpload(pdiv,vid,limit,server) {
  
    var $list = $("#fileList"+pdiv), uploader;
    var  thumbnailWidth = 100, thumbnailHeight = 100;
    $(document).on('click','.cancel'+pdiv,function(){
        var temp=$(vid).val();
        var pic=$(this).parent().attr('arc');
        temp=temp.replace(pic,'');
        temp=updateString(temp);
        $(vid).val(temp);
        $(this).parent().parent().remove();
    })
    uploader = WebUploader.create({
        // 自动上传。
        auto: true,
        // 文件接收服务端。
        server: server,
        // 选择文件的按钮。可选。
        // 内部根据当前运行是创建，可能是input元素，也可能是flash.
        pick: '#filePicker'+pdiv,
        // 只允许选择文件，可选。
        fileNumLimit:limit,
        accept: {
            title: 'Images',
            extensions: 'gif,jpg,jpeg,bmp,png',
            mimeTypes: 'image/jpg,image/jpeg,image/png'
        },
        compress:false
    });
    uploader.on( 'fileQueued', function( file ) {
        if(limit==1){
            
            $('.cancel'+pdiv).parent().parent().remove();
        }
        var $li = $(
                '<div id="' + file.id + '" class="file-item thumbnail">' +
                '<img>' +
                '<div class="info">' + file.name + '</div>' +
                '</div>'
            ),
            $img = $li.find('img');
        $list.append( $li );
        $(document).on('click','.cancel'+pdiv,function(){
            var temp=$(vid).val();
            var pic=$(this).parent().attr('arc');
            temp=temp.replace(pic,'');
            temp=updateString(temp);
            uploader.removeFile( file )
            $(vid).val(temp);
            $(this).parent().parent().remove();
        })
        // 创建缩略图
        uploader.makeThumb( file, function( error, src ) {
            if ( error ) {
                $img.replaceWith('<span>不能预览</span>');
                return;
            }
            $img.attr( 'src', src );
        }, thumbnailWidth, thumbnailHeight );
    });
    uploader.on( 'uploadProgress', function( file, percentage ) {
        var $li = $( '#'+file.id ),
            $percent = $li.find('.progress span');
        // 避免重复创建
        if ( !$percent.length ) {
            $percent = $('<p class="progress"><span></span></p>')
                .appendTo( $li )
                .find('span');
        }
        $percent.css( 'width', percentage * 100 + '%' );
    });
    uploader.on( 'uploadSuccess', function( file,data ) {
        if(data.data){
            $( '#'+file.id ).addClass('upload-state-done');
            var temp=$(vid).val();
            if(temp && limit>1){
                temp+=','+data.data;
                $(vid).val(temp);
            }else{
                $(vid).val(data.data);
            }
            $( '#'+file.id ).append('<div class="file-panel " arc='+data.data +' style="height: 25px;"><span class="cancel'+pdiv+'">删除</span></div>')
        }else{
            var $li = $( '#'+file.id ),
                $error = $li.find('div.error');

            // 避免重复创建
            if ( !$error.length ) {
                $error = $('<div class="error ">上传失败<span class="cancel'+pdiv+'">删除</span></div>').appendTo( $li );
            }
            // $error.text('上传失败');
        }

    });
    uploader.on( 'uploadError', function( file ) {
        var $li = $( '#'+file.id ),
            $error = $li.find('div.error');

        // 避免重复创建
        if ( !$error.length ) {
            $error = $('<div class="error">上传失败<span class="cancel'+pdiv+'">删除</span></div>').appendTo( $li );
        }

    });
    uploader.on( 'uploadComplete', function( file ) {
        $( '#'+file.id ).find('.progress').remove();
    });
}
/**
 * 删除
 * @param i
 * @param vid
 */
function updateString(string){
    var str=string.split(',');
    for(var i=0;i<str.length;i++){
        if(!str[i]){
            str.splice(i,1);
            i--;
        }
    }
    return str.join(',');
}