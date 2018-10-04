<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>91影片列页</title>
    <script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>
    <link href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
</head>
<body>
<br>
<h4 class="text-info" align="center">列出编号范围内可播放电影</h4>
<br>
<div id="container"></div>

<div align="center">
    <input id="reducedButton" class="btn btn-primary"  type="button" onclick="lostNum()" value="-100">
    <input id="startPoint"  class="form-control" style="display: inline;width: 100px;" type="text" placeholder="1-26万" />
    -- <input id="endPoint"  class="form-control" style="display: inline;width: 100px;" type="text" placeholder="1-26万" />
    <input id="addedButton" class="btn btn-primary" type="button" onclick="addNum()" value="+100">
    <br>
    <br>

    展示数:<input id="displayText" type="text" class="form-control" style="display: inline;width: 100px;" onblur="showValue()"  onfocus="hideValue(this)" placeholder="展示条数" />
    <input class="btn btn-primary" type="button" onclick="go()" value="执行">
</div>
<br>
<script type="text/javascript">
    if(!Number(localStorage.startId)>0){
        localStorage.svid = 260000;
        localStorage.pages = 100;
        localStorage.startId = 1;
    }
    localStorage.startId++;
    displayText.value = localStorage.pages;
    show();

    function lostNum(){
        localStorage.svid = Number(localStorage.svid) - Number(displayText.value);
        if(Number(localStorage.svid) < 1){localStorage.svid = 1;}
        show();
    }
    function addNum(){
        localStorage.svid = Number(localStorage.svid) + Number(displayText.value);
        show();
    }

    //服务器不支持跨域,status返回0
    function clearVedio(){
        //加载失败删除节点及播放器 手机qq浏览器不支持,不知道是dom的原因还是事件的原因
        document.getElementById("container").removeChild(this.previousSibling);
        document.getElementById("container").removeChild(this);
    }

    function hideValue(t){
        t.value="";
    }
    function showValue(){
        if (displayText.value == "") {
            displayText.value = localStorage.pages;
        }
        if(Number(displayText.value) > 200){
            if(!confirm("展示条数过大,可能导致浏览器内存不足,确定?")){
                displayText.value = localStorage.pages;
            }
        }
        localStorage.pages = displayText.value;
        show();
    }

    function show(){
        startPoint.value = localStorage.svid;
        endPoint.value = Number(localStorage.svid) + Number(localStorage.pages);
        displayText.value = localStorage.pages;
        reducedButton.value = "-" + localStorage.pages;
        addedButton.value = "+" + localStorage.pages;
    }

    function go(){
        var newNodel;
        for(var j = startPoint.value; j < Number(endPoint.value); j++){
            textNode = document.createTextNode(j+":");
            document.getElementById("container").appendChild(textNode);

            newNode = document.createElement("img");
            newNode.setAttribute("src", "http://68.235.41.51/thumb/1_"+ j +".jpg");
            document.getElementById("container").appendChild(newNode);

            newNode = document.createElement("img");
            newNode.setAttribute("src", "http://68.235.41.51/thumb/2_"+ j +".jpg");
            document.getElementById("container").appendChild(newNode);

            newNode = document.createElement("img");
            newNode.setAttribute("src", "http://68.235.41.51/thumb/3_"+ j +".jpg");
            document.getElementById("container").appendChild(newNode);

            newNode = document.createElement("a");
            newNode.setAttribute("href", "http://92.91p22.space//player_vid.php?VID="+ j);
            newNode.setAttribute("target", "_blank");
            textNode = document.createTextNode("影片主页");
            newNode.appendChild(textNode);
            document.getElementById("container").appendChild(newNode);

            newNode = document.createElement("a");
            newNode.setAttribute("href", "http://192.240.120.34//mp43/"+ j +".mp4");
            newNode.setAttribute("target", "_blank");
            textNode = document.createTextNode("影片链接 ");
            newNode.appendChild(textNode);
            document.getElementById("container").appendChild(newNode);

            //影片载入
            newNode = document.createElement("video");
            newNode.setAttribute("src", "http://192.240.120.34//mp43/"+ j +".mp4");
            newNode.setAttribute("width", "150px");
            newNode.setAttribute("height", "150px");
            newNode.setAttribute("preload", "metadata");
            newNode.onerror = clearVedio;
            document.getElementById("container").appendChild(newNode);
            newNode = document.createElement("br");
            document.getElementById("container").appendChild(newNode);
            newNode = document.createElement("br");
            document.getElementById("container").appendChild(newNode);

            newNode = document.createElement("p");
            newNode.setAttribute("style", "border-bottom: solid 1px");
            document.getElementById("container").appendChild(newNode);
        }
    }
</script>
</body>
</html>