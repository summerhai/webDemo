//Date picker
$('#reservationtime').daterangepicker({ timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A' })
$(function () {
    initFlot();
    sendAjax1();
    sendAjax2();
    initDataTable();
})

function initFlot() {
    /*
     * Flot Interactive Chart
     * -----------------------
     */
    // We use an inline data source in the example, usually data would
    // be fetched from a server
    var data = [], totalPoints = 100

    function getRandomData() {

        if (data.length > 0)
            data = data.slice(1)

        // Do a random walk
        while (data.length < totalPoints) {

            var prev = data.length > 0 ? data[data.length - 1] : 50,
                y = prev + Math.random() * 10 - 5

            if (y < 0) {
                y = 0
            } else if (y > 100) {
                y = 100
            }

            data.push(y)
        }

        // Zip the generated y values with the x values
        var res = []
        for (var i = 0; i < data.length; ++i) {
            res.push([i, data[i]])
        }

        return res
    }

    var interactive_plot = $.plot('#interactive', [getRandomData()], {
        grid: {
            borderColor: '#f3f3f3',
            borderWidth: 1,
            tickColor: '#f3f3f3'
        },
        series: {
            shadowSize: 0, // Drawing is faster without shadows
            color: '#3c8dbc'
        },
        lines: {
            fill: true, //Converts the line chart to area chart
            color: '#3c8dbc'
        },
        yaxis: {
            min: 0,
            max: 100,
            show: true
        },
        xaxis: {
            show: true
        }
    })

    var updateInterval = 500 //Fetch data ever x milliseconds
    var realtime = 'on' //If == to on then fetch data every x seconds. else stop fetching
    function update() {

        interactive_plot.setData([getRandomData()])

        // Since the axes don't change, we don't need to call plot.setupGrid()
        interactive_plot.draw()
        if (realtime === 'on')
            setTimeout(update, updateInterval)
    }

    //INITIALIZE REALTIME DATA FETCHING
    if (realtime === 'on') {
        update()
    }
    //REALTIME TOGGLE
    $('#realtime .btn').click(function () {
        if ($(this).data('toggle') === 'on') {
            realtime = 'on'
        }
        else {
            realtime = 'off'
        }
        update()
    })
    /*
     * END INTERACTIVE CHART
     */
}

function sendAjax1(){
    //发送Ajax请求更新数据
    $.ajax({
        url:CONTEXTPATH+"/static/json/device1.json",
        type:"GET",
        success:function(data){
            //当后台请求到最新数据时返回true，更新前台数据
            if(data.flag){
                $("#devoice1Body").html("");
                $("#device1Tmpl").tmpl(data).appendTo($("#device1Body"));
            }
        }
    });
}

function sendAjax2(){
    //发送Ajax请求更新数据
    $.ajax({
        url:CONTEXTPATH+"/static/json/device1Sum.json",
        type:"GET",
        success:function(data){
            //当后台请求到最新数据时返回true，更新前台数据
            if(data.flag){
                $("#devoice1SumBody").html("");
                $("#device1SumTmpl").tmpl(data).appendTo($("#device1SumBody"));
            }
        }
    });
}

function initDataTable(){
    var curTable = $("#dataTableId").DataTable({
        processing: true,
        serverSide: true,
        lengthChange: true,//是否允许用户改变表格每页显示的记录数
        lengthMenu: [5],   // 每页显示数据（默认是10）
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
            url: CONTEXTPATH+'/admin/trendReport/tableData',
            type: 'POST'
        },
        columns: [
            {data : null,
                "render" : function(data, type, full, meta){
                    return meta.row + 1 + meta.settings._iDisplayStart;
                }},
            {
                data: "collectTime", render:function (data,type,row) {
                    return timestampToTime(data);
                }
            },
            {data: "setPower"},
            {data: "runPower"},
            {data: "allSum"}
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
    m = date.getMinutes() < 10 ? '0'+(date.getMinutes()) : date.getMinutes() + ":";
    s = date.getSeconds() < 10 ? '0'+(date.getSeconds()) : date.getSeconds();
    return Y+M+D+h+m+s;
}