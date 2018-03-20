var img;

$(function () {
    showTime();
    initCanvas();
    setInterval(myClickHandler,1000);
})

function showTime() {
    setInterval("curTime.innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt (new Date().getDay());", 1000);
}

//Date picker
$('#datepicker').datepicker({
    autoclose: true
})

function initCanvas() {
    var canvas = document.getElementById("myCanvas");
    var ctxs;
    canvas.width = $("#myCopyImage").parent().width();
    canvas.height = $("#myCopyImage").parent().height();
    if(navigator.userAgent.indexOf("MSIE")>0)
    {
        $(canvas).height($("#myCopyImage").parent().height());
    }
    img = new Image();
    //简单地检测当前浏览器是否支持Canvas对象，以免在一些不支持html5的浏览器中提示语法错误
    if(canvas.getContext){
        //获取对应的CanvasRenderingContext2D对象(画笔)
        ctx = canvas.getContext("2d");

        //创建新的图片对象
        //指定图片的URL
        img.src = CONTEXTPATH+"/static/imgs/sewerage.png";
        img.width = "80%";
        img.height = "80%";
        //浏览器加载图片完毕后再绘制图片
        img.onload = function(){
            //以Canvas画布上的坐标(10,10)为起始点，绘制图像
            ctx.drawImage(img, 10,10,ctx.canvas.width,ctx.canvas.height);
        };
    }
}

function myClickHandler()
{
    ctx.drawImage(img, 10,10,ctx.canvas.width,ctx.canvas.height);
    ctx.fillStyle="#0000ff";
    ctx.font = "10pt Calibri blod";
    ctx.fillStyle = 'blue';
    ctx.fillText("运行中", 125, 280);
    ctx.fillText("运行中", 260, 260);
    // ctx.fillText(Math.round(20+Math.random()*10)+"度", 1400, 280);
    ctx.fillStyle="#0000ff";
    ctx.font = "10pt Calibri blod";
    ctx.fillStyle = 'red';
    ctx.fillText("停止", 380, 300);
    // ctx.fillText(Math.round(20+Math.random()*10)+"度", 1500, 80);
}


