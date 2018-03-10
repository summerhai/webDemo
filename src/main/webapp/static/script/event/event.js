//Date picker
$('#reservationtime').daterangepicker({ timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A' })
$(function () {
    initEventTable();
})

function initEventTable(){
    var curTable = $("#eventTable").DataTable({
        processing: true,
        serverSide: true,
        lengthChange: true,//是否允许用户改变表格每页显示的记录数
        // lengthMenu: [10],   // 每页显示数据（默认是10）
        ordering: true,//是否允许用户排序
        paging: true,//是否分页
        pagingType: "full_numbers",//除首页、上一页、下一页、末页四个按钮还有页数按钮
        /* scrollX: true,//允许水平滚动
         scrollY: "200px",
         scrollCollapse: true, */
        searching: true,//是否开始本地搜索
        stateSave: false,//刷新时是否保存状态
        autoWidth: true,//自动计算宽度
        deferRender : true,//延迟渲染
        select: true,
        buttons: [
            'selectAll',
            'selectNone'
        ],
        language: {
            "lengthMenu": "每页 _MENU_ 条记录",
            "zeroRecords": " ",
            "info": "当前 _START_ 条到 _END_ 条 共 _TOTAL_ 条",
            "infoEmpty": "无记录",
            "infoFiltered": "(从 _MAX_ 条记录过滤)",
            "search": "模糊查找",
            "processing": "载入中",
            "paginate": {
                "first": "首页",
                "previous": "上一页",
                "next": "下一页",
                "last": "尾页"
            },
            buttons: {
                selectAll: "全选",
                selectNone: "全不选"
            }
        },
        ajax: {
            url: CONTEXTPATH+'/event/list',
            type: 'POST'
        },
        columns: [
            {data : null,
                "render" : function(data, type, full, meta){
                    return meta.row + 1 + meta.settings._iDisplayStart;
                }},
            {
                data: "operationTime", render:function (data,type,row) {
                    return timestampToTime(data);
                }
            },
            {data: "userName"},
            {data: "eventOperation"},
            {data: "ip"}
        ]
    });
}

/**
 * 将时间戳转为yyyy-MM-dd HH:mm:ss格式数据
 * @param timestamp
 * @returns {*}
 */
function timestampToTime(timestamp) {
    var date = new Date(timestamp);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
    Y = date.getFullYear() + '-';
    M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
    D = date.getDate() + ' ';
    h = date.getHours() + ':';
    m = date.getMinutes() + ':';
    s = date.getSeconds() < 10 ? '0'+(date.getSeconds()) : date.getSeconds();
    return Y+M+D+h+m+s;
}