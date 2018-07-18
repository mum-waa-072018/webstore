<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
 <meta name="keywords" content="" />
<script
		src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>

    <title>Chat</title>


<style>
.chatBody{
	margin-top:5px;
}

</style>
  <div class="chatBody">
    <div class="container">
    	<div class="row">
    		<div class="col-md-3">
    		<div class="panel panel-primary">
				  <div class="panel-heading">
				    <h3 class="panel-title">Current User</h3>
				  </div>
				  <div class="panel-body">
				    <div class="list-group">
					 <a href="#" class="list-group-item">Hi，${USER_SESSION_KEY.firstName}</a>
					 <a href="<%=path%>/logout" class="list-group-item">Exit</a>
					</div>
				  </div>
				</div>
    			<div class="panel panel-primary" id="online">
				  <div class="panel-heading">
				    <h3 class="panel-title">Other Onlone User</h3>
				  </div>
				  <div class="panel-body">
				    <div class="list-group" id="users">
					</div>
				  </div>
				</div>

    		</div>
  			<div class="col-md-9">
  				<div class="panel panel-primary">
				  <div class="panel-heading">
				    <h3 class="panel-title" id="talktitle"></h3>
				  </div>
				  <div class="panel-body">
				    <div class="well" id="log-container" style="height:400px;overflow-y:scroll">
				   <c:forEach var="data"  items="${chatRecords}">
					   <div class='bg-info'>
						   <label class='text-danger'>${data.fromName}&nbsp;${data.date}</label>
						   <div class='text-success'>${data.text}</div>
					   </div>
					   <br>
				   </c:forEach>
				    </div>

							<textarea id="msg"    style="width:700px;height:300px;">
							</textarea><br>
							<button id="broadcast" type="button" class="btn btn-primary">Send</button>
				    </div>
				</div>
  			</div>
    	</div>
    </div> 
<script>

	function getRootPath(){   
		return "<%=path%>/";
	}

    $(document).ready(function() {
		function getProjectName(){
			var curWwwPath=window.document.location.href;

//获取主机地址之后的目录如：/Tmall/index.jsp
			var pathName=window.document.location.pathname;
			var pos=curWwwPath.indexOf(pathName);

//获取主机地址，如：//localhost:8080
			var localhostPaht=curWwwPath.substring(0,pos);

//获取带"/"的项目名，如：/Tmall
			var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);

		}

        <%--var websocket = new WebSocket("ws://localhost:"+ window.location.port+"/"+getProjectName()+"/ws?uid="+${USER_SESSION_KEY.id});--%>
		var websocket = new WebSocket("ws://localhost:"+ window.location.port+"/ws?uid="+${USER_SESSION_KEY.id});

        websocket.onmessage = function(event) {
       	 var data=JSON.parse(event.data);
       	 	if(data.fromId>0||data.fromId==-1){//用户或者群消息
            // 接收服务端的实时消息并添加到HTML页面中
            $("#log-container")
					.append("<div class='bg-info'><label class='text-danger'>"+data.fromName+"&nbsp;"+data.date+"</label><div class='text-success'>"+data.text+"</div></div><br>");
            // 滚动条滚动到最低部
            scrollToBottom();
            }else if(data.fromId==0){//if online
            	if(data.text!="${USER_SESSION_KEY.firstName}")
            	{	
            		$("#users").append('<a href="'+getRootPath()+'userInfo?id='+data.userId+'" target="_blank" class="list-group-item">'+'<img src="'+getRootPath()+'uploadimage/'+data.avatar+'" class="img-circle pull-left" width="20px" height="20px" ></img>'+data.text+'</a>');
            	}
            }else if(data.fromId==-2){//if off line
            	if(data.text!="${USER_SESSION_KEY.firstName}")
            	{	
            		$("#users > a").remove(":contains('"+data.text+"')");
            	}
            }
        };
        
        $.post(getRootPath()+"chatroom/onlineusers",function(data){
    		for(var i=0;i<data.length;i++){
    			$("#users").append('<a href="'+getRootPath()+'userInfo?id='+data[i].id+'" target="_blank"  class="list-group-item">'+'<img src="'+getRootPath()+'resource/images/default.jpg'+'" class="img-circle pull-left" width="20px" height="20px" ></img>'+data[i].firstName+'</a>');
    		}
   		});
        
        $("#broadcast").click(function(){
			$("#msg").empty();
        	$.post(getRootPath()+"chatroom/broadcast",{"text":$("#msg").val()});
        });
        
        $("#send").click(function(){
        	$.post(getRootPath()+"chatroom/getuid",{"firstName":$(".chatBody").data("toId")},function(d){
        		var v=$("#myinfo").val();
        		
				if(v==""){
					return;
				}else{
					var data={};
					data["fromId"]="${USER_SESSION_KEY.id}";
					data["fromName"]="${USER_SESSION_KEY.firstName}";
					data["toId"]=d.id;
					data["text"]=v;
					websocket.send(JSON.stringify(data));
					$("#log-container").append("<div class='bg-success'><label class='text-info'>Me &nbsp;"+new Date()+"</label><div class='text-info'>"+v+"</div></div><br>");
					scrollToBottom();
					$("#myinfo").val("");
				}
        	});
        	
        });
    });
   

   function scrollToBottom(){
		var div = document.getElementById('log-container');
		div.scrollTop = div.scrollHeight;
	}
</script>    
  </div>
