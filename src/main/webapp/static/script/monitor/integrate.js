
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
        url:CONTEXTPATH+"/static/json/monitor.json",
        type:"GET",
        success:function(data){
            //当后台请求到最新数据时返回true，更新前台数据
            if(data.flag){
                $("#sewerage1Body").html("");
                $("#sewerage1Tmpl").tmpl(data).appendTo($("#sewerage1Body"));
            }
        }
    });
}
