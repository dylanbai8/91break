<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>91破解</title>
    <script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>
    <link href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
</head>
<body>
<br>
<br>

<div align="center">
    <input class="btn btn-default" type="button" onclick="lostNum();" value="-1">
    <img  id="imgA" src="" alt="未加载图片"/>
    <img id="imgB" src="" alt="未加载图片" />
    <img  id="imgC" src="" alt="未加载图片"/>
    <input class="btn btn-default" type="button" onclick="addNum();" value="+1">
    <br>

    <br>
    <p class="text-info" style="display: inline;font-size: 16px;">影片编号:</p>
    <input class="form-control" id="filmNumber" type="text" onblur="showValue();"  onfocus="hideValue();" placeholder="粘贴图片地址" style="display: inline-block;width: 150px;" >
    <input class="btn btn-default" type="button" onclick="skip()" value="跳转">
    <br>
    <br>

    <!--embed需要flash格式的视频,所以不能播放,可删-->
    <video id="mainVideo" width="auto" height="auto" src="" controls>您的浏览器不支持 video 标签。</video>
    <br/>

    <a id="filmPage" href="http://91.91p17.space//player_vid.php?VID=102331" target="_blank">影片主页</a>
    <a id="filmLink" href="http://192.240.120.34//mp43/102331.mp4" target="_blank">影片链接</a>
    <br>

    <input class="btn btn-primary" id="buttonD" type="button" onclick="changePage();" value="切换至影片主页"></input>
    <br>
    <p class="text-info" align="center" style="color: #EEEEEE;">ps:可直接粘贴图片地址到影片编号</p>
</div>

<iframe id="mainFrame" src="http://91.91p17.space/index.php" width="100%" height="2000px" frameborder="0"></iframe>

<script type="text/javascript">
    if (!Number(localStorage.vid) > 0) {
        //localStorage.vid = 74850;
        localStorage.vid = 102331;
    }
    var homeOn = true;
    var lordOn = false;
    show();

    function lostNum(){
        localStorage.vid--;
        show();
    }
    function addNum(){
        localStorage.vid++;
        show();
    }

    function hideValue(){
        filmNumber.value="";
    }
    function showValue(){
        if (filmNumber.value == "") {
            filmNumber.value = localStorage.vid;
        }
        //提取图片地址中的影片编号
        filmNumber.value = filmNumber.value.replace("http://img.t6k.co/thumb/", "");
        filmNumber.value = filmNumber.value.replace(/\d?\_/, "");
        filmNumber.value = filmNumber.value.replace(".jpg", "");
        localStorage.vid=filmNumber.value;
    }

    function skip(){
        localStorage.vid=filmNumber.value;
        show();
    }

    function changePage(){
        if(homeOn){
            homeOn=false;
            mainFrame.src="http://91.91p17.space/index.php"
            buttonD.value="切换至影片主页"
        }else{
            homeOn=true;
            mainFrame.src=filmPage.href;
            buttonD.value="切换至首页";
        }
    }

    function show(){
        imgA.src="http://68.235.41.51/thumb/1_"+localStorage.vid+".jpg";
        imgB.src="http://68.235.41.51/thumb/2_"+localStorage.vid+".jpg";
        imgC.src="http://68.235.41.51/thumb/3_"+localStorage.vid+".jpg";
        filmLink.href="http://192.240.120.34//mp43/"+localStorage.vid+".mp4";
        filmPage.href="http://91.91p17.space//player_vid.php?VID="+localStorage.vid;
        mainVideo.src="http://192.240.120.34//mp43/"+localStorage.vid+".mp4";
        mainVideo.onerror = tryLoad;
        lordOn = false;
        document.getElementById("filmNumber").value = localStorage.vid;
    }
    //使用另一个服务器再次加载,可能有用
    function tryLoad(){
        if(lordOn == false){
            mainVideo.src="http://185.38.13.159//mp43/"+localStorage.vid+".mp4";
            lordOn = true;
        }
    }
</script>
<!-- 备用影片ip:185.38.13.159-->
</body>
</html>
