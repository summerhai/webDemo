//Date picker
$('#reservationtime').daterangepicker({ timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A' })
$(function () {
    mudFlot();
    temperatureFlot();
    humidityFlot();
})


function mudFlot() {
    var dataArray = [];
    var dataset;
    var totalPoints = 10;
    //每5分钟更新一次
    var updateInterval = 300000;
    // var now = new Date().getTime();

    function GetData() {
        dataArray.splice(0,dataArray.length);
        $.ajax({
            url:CONTEXTPATH+"/admin/mudData",
            type:"GET",
            async:false,
            success:function(data){
                console.log(data.x.length);
                for(var i=0;i<data.x.length;i++){
                    var x = data.x[i];
                    var y = data.y[i];
                    var temp = [x,y];
                    dataArray.push(temp);
                }
            }
        });
    }

    var options = {
        series: {
            lines: {
                show: true,
                lineWidth: 1.2,
                fill: true
            }
        },
        xaxis: {
            mode: "time",
            tickSize: [5, "minute"],
            tickFormatter: function (v, axis) {
                var date = new Date(v);

                if (date.getSeconds() % 30 == 0) {
                    var hours = date.getHours() < 10 ? "0" + date.getHours() : date.getHours();
                    var minutes = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
                    var seconds = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();

                    return hours + ":" + minutes + ":" + seconds;
                } else {
                    return "";
                }
            },
            axisLabel: "Time",
            axisLabelUseCanvas: true,
            axisLabelFontSizePixels: 12,
            axisLabelFontFamily: 'Verdana, Arial',
            axisLabelPadding: 10
        },
        yaxis: {
            min: 0,
            max: 10,
            tickSize: 1,
            tickFormatter: function (v, axis) {
                if (v % 1 == 0) {
                    return v;
                } else {
                    return "";
                }
            },
            axisLabel: "泥位信号",
            axisLabelUseCanvas: true,
            axisLabelFontSizePixels: 12,
            axisLabelFontFamily: 'Verdana, Arial',
            axisLabelPadding: 6
        },
        legend: {
            labelBoxBorderColor: "#fff"
        },
        grid: {
            backgroundColor: "#fff",
            tickColor: "#203080"
        }
    };
    dataset = [
        { label: "泥位信号", data: dataArray, color: "#fffd30" }
    ];

    var realtime = 'on' //If == to on then fetch dataArray every x seconds. else stop fetching

    //INITIALIZE REALTIME DATA FETCHING
    if (realtime === 'on') {
        update()
    }
    //REALTIME TOGGLE
    $('#mudRealtime .btn').click(function () {
        if ($(this).data('toggle') === 'on') {
            realtime = 'on'
        }
        else {
            realtime = 'off'
        }
        update()
    })

    function update() {
        console.log("当前是:"+realtime)
        GetData();
        console.log(dataArray);
        $.plot($("#mudFlot"), dataset, options)
        if (realtime === 'on')
            setTimeout(update, updateInterval)
        console.log("执行完update")
    }

}

function temperatureFlot() {
    var dataArray = [];
    var dataset;
    var totalPoints = 10;
    //没分钟更新一次
    var updateInterval = 60000;
    // var now = new Date().getTime();

    function GetData() {
        dataArray.splice(0,dataArray.length);
        $.ajax({
            url:CONTEXTPATH+"/admin/temperatureData",
            type:"GET",
            async:false,
            success:function(data){
                console.log(data.x.length);
                for(var i=0;i<data.x.length;i++){
                    var x = data.x[i];
                    var y = data.y[i];
                    var temp = [x,y];
                    dataArray.push(temp);
                }
            }
        });
    }

    var options = {
        series: {
            lines: {
                show: true,
                lineWidth: 1.2,
                fill: true
            }
        },
        xaxis: {
            mode: "time",
            tickSize: [1, "minute"],
            tickFormatter: function (v, axis) {
                var date = new Date(v);

                if (date.getSeconds() % 30 == 0) {
                    var hours = date.getHours() < 10 ? "0" + date.getHours() : date.getHours();
                    var minutes = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
                    var seconds = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();

                    return hours + ":" + minutes + ":" + seconds;
                } else {
                    return "";
                }
            },
            axisLabel: "Time",
            axisLabelUseCanvas: true,
            axisLabelFontSizePixels: 12,
            axisLabelFontFamily: 'Verdana, Arial',
            axisLabelPadding: 10
        },
        yaxis: {
            min: 0,
            max: 10,
            tickSize: 1,
            tickFormatter: function (v, axis) {
                if (v % 1 == 0) {
                    return v;
                } else {
                    return "";
                }
            },
            axisLabel: "温度数值",
            axisLabelUseCanvas: true,
            axisLabelFontSizePixels: 12,
            axisLabelFontFamily: 'Verdana, Arial',
            axisLabelPadding: 6
        },
        legend: {
            labelBoxBorderColor: "#fff"
        },
        grid: {
            backgroundColor: "#fff",
            tickColor: "#203080"
        }
    };
    dataset = [
        { label: "温度数值", data: dataArray, color: "#160dff" }
    ];

    var realtime = 'on' //If == to on then fetch dataArray every x seconds. else stop fetching

    //INITIALIZE REALTIME DATA FETCHING
    if (realtime === 'on') {
        update()
    }
    //REALTIME TOGGLE
    $('#temperatureRealtime .btn').click(function () {
        if ($(this).data('toggle') === 'on') {
            realtime = 'on'
        }
        else {
            realtime = 'off'
        }
        update()
    })

    function update() {
        console.log("当前是:"+realtime)
        GetData();
        console.log(dataArray);
        $.plot($("#temperatureFlot"), dataset, options)
        if (realtime === 'on')
            setTimeout(update, updateInterval)
        console.log("执行完update")
    }

}

function humidityFlot() {
    var dataArray = [];
    var dataset;
    var totalPoints = 10;
    //没分钟更新一次
    var updateInterval = 60000;
    // var now = new Date().getTime();

    function GetData() {
        dataArray.splice(0,dataArray.length);
        $.ajax({
            url:CONTEXTPATH+"/admin/humidityData",
            type:"GET",
            async:false,
            success:function(data){
                console.log(data.x.length);
                for(var i=0;i<data.x.length;i++){
                    var x = data.x[i];
                    var y = data.y[i];
                    var temp = [x,y];
                    dataArray.push(temp);
                }
            }
        });
    }

    var options = {
        series: {
            lines: {
                show: true,
                lineWidth: 1.2,
                fill: true
            }
        },
        xaxis: {
            mode: "time",
            tickSize: [1, "minute"],
            tickFormatter: function (v, axis) {
                var date = new Date(v);

                if (date.getSeconds() % 30 == 0) {
                    var hours = date.getHours() < 10 ? "0" + date.getHours() : date.getHours();
                    var minutes = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
                    var seconds = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();

                    return hours + ":" + minutes + ":" + seconds;
                } else {
                    return "";
                }
            },
            axisLabel: "Time",
            axisLabelUseCanvas: true,
            axisLabelFontSizePixels: 12,
            axisLabelFontFamily: 'Verdana, Arial',
            axisLabelPadding: 10
        },
        yaxis: {
            min: 0,
            max: 10,
            tickSize: 1,
            tickFormatter: function (v, axis) {
                if (v % 1 == 0) {
                    return v;
                } else {
                    return "";
                }
            },
            axisLabel: "湿度数值",
            axisLabelUseCanvas: true,
            axisLabelFontSizePixels: 12,
            axisLabelFontFamily: 'Verdana, Arial',
            axisLabelPadding: 6
        },
        legend: {
            labelBoxBorderColor: "#fff"
        },
        grid: {
            backgroundColor: "#fff",
            tickColor: "#203080"
        }
    };
    dataset = [
        { label: "湿度数值", data: dataArray, color: "#160dff" }
    ];

    var realtime = 'on' //If == to on then fetch dataArray every x seconds. else stop fetching

    //INITIALIZE REALTIME DATA FETCHING
    if (realtime === 'on') {
        update()
    }
    //REALTIME TOGGLE
    $('#humidityRealtime .btn').click(function () {
        if ($(this).data('toggle') === 'on') {
            realtime = 'on'
        }
        else {
            realtime = 'off'
        }
        update()
    })

    function update() {
        console.log("当前是:"+realtime)
        GetData();
        console.log(dataArray);
        $.plot($("#humidityFlot"), dataset, options)
        if (realtime === 'on')
            setTimeout(update, updateInterval)
        console.log("执行完update")
    }

}