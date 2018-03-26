function initHeight() {

    var height1 = $('#jiankong1').height();
    var height2 = $('#jiankong1').outerHeight();
    var height3 = $('#jiankong1').outerHeight(true);
    var height4 = document.getElementById("jiankong1").style.height;
    console.log("height");
    console.log(height1);
    console.log(height2);
    console.log(height3);
    console.log(height4);
    $('#jiankong2').height(height);
    $('#jiankong2').css("height",height);
    $('#jiankong3').css("height",height);
}
$(function () {
    showTime();
    sendAjax();

})
function showTime() {
    setInterval("curTime.innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt (new Date().getDay());", 1000);
}
function sendAjax(){
    //发送Ajax请求更新数据
    $.ajax({
        url:CONTEXTPATH+"/admin/integrate/sewerage",
        type:"GET",
        success:function(data){
            //当后台请求到最新数据时返回true，更新前台数据
            if(data.flag){
                $("#sewerage1Body").html("");
                $("#sewerage1Tmpl").tmpl(data).appendTo($("#sewerage1Body"));
            }
        }
    });
    $.ajax({
        url:CONTEXTPATH+"/admin/integrate/anhuan",
        type:"GET",
        success:function(data){
            //当后台请求到最新数据时返回true，更新前台数据
            if(data.flag){
                $("#anhuanBody").html("");
                $("#anhuanTmpl").tmpl(data).appendTo($("#anhuanBody"));
            }
        }
    });
    // initHeight();
}
