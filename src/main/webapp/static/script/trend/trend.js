//Date picker
$('#reservationtime').daterangepicker({ timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A' })
$(function () {
    mudFlot();
    temperatureFlot();
    humidityFlot();
})


function mudFlot() {
    var data = [];
    var dataset;
    var totalPoints = 100;
    var updateInterval = 1000;
    var now = new Date().getTime();


    function GetData() {

        data.shift();

        while (data.length < totalPoints) {
            var y = Math.random() * 100;
            var temp = [now += updateInterval, y];

            data.push(temp);
        }
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
            tickSize: [30, "second"],
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
            max: 100,
            tickSize: 10,
            tickFormatter: function (v, axis) {
                if (v % 10 == 0) {
                    return v;
                } else {
                    return "";
                }
            },
            axisLabel: "泥位液位",
            axisLabelUseCanvas: true,
            axisLabelFontSizePixels: 12,
            axisLabelFontFamily: 'Verdana, Arial',
            axisLabelPadding: 6
        },
        legend: {
            labelBoxBorderColor: "#ffffff"
        },
        grid: {
            backgroundColor: "#ffffff",
            tickColor: "#3c8dbc"
        }
    };

    dataset = [
        {data: data}
    ];

    var realtime = 'on' //If == to on then fetch data every x seconds. else stop fetching

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
        $.plot($("#mudFlot"), dataset, options)
        if (realtime === 'on')
            setTimeout(update, updateInterval)
    }

}

function temperatureFlot() {
    console.log("进入temperatureFlot")
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
        // console.log(res);
        return res
    }

    var interactive_plot = $.plot('#temperatureFlot', [getRandomData()], {
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
    $('#temperatureRealtime .btn').click(function () {
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

function humidityFlot() {
    console.log("humidityFlot")
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
        // console.log(res);
        return res
    }

    var interactive_plot = $.plot('#humidityFlot', [getRandomData()], {
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
    $('#humidityRealtime .btn').click(function () {
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