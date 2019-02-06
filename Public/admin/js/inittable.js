function initTable(table,url,columns) {
    $(window).resize(function() {
        $(table).bootstrapTable('resetView', {
            height: tableHeight()
        })
    })
    $(table).bootstrapTable({
        url: url, //数据源
        dataField: "rows", //服务端返回数据键值 就是说记录放的键值是rows，分页时使用总记录数的键值为total
        height: tableHeight(), //高度调整
        search: true, //是否搜索
        pagination: true, //是否分页
        pageSize: 20, //单页记录数
        pageList: [10, 20, 50, 100], //分页步进值
        sidePagination: "server", //服务端分页
        contentType: "application/x-www-form-urlencoded", //请求数据内容格式 默认是 application/json 自己根据格式自行服务端处理
        dataType: "json", //期待返回数据类型
        method: "post", //请求方式
        searchAlign: "right", //查询框对齐方式
        queryParamsType: "limit", //查询参数组织方式
        queryParams: function getParams(params) {
            params.flag = "1";
            return params;
        },
        searchOnEnterKey: false, //回车搜索
        showRefresh: true, //刷新按钮
        showColumns: true, //列选择按钮
        buttonsAlign: "right", //按钮对齐方式
        toolbar: "#toolbar", //指定工具栏
        toolbarAlign: "left", //工具栏对齐方式
        columns: columns,
        locale: "zh-CN", //中文支持
        detailView: false, //是否显示详情折叠
    });
}
function tableHeight() {
    return $(window).height() - 100;
}
function formatTime(time) {
    
    var now = new Date(parseInt(time) * 1000);
    var year = now.getFullYear();
    var month = now.getMonth() + 1 >= 10 ? now.getMonth() + 1 : '0' + (now.getMonth() + 1);
    var date = now.getDate() >= 10 ? now.getDate() : '0' + now.getDate();
    var hour = now.getHours();
    var minute = now.getMinutes();
    var second = now.getSeconds();
    return year + "-" + month + "-" + date + " " + hour + ":" + minute + ":" + second;
}