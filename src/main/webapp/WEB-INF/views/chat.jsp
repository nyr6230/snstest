<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chatting</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
    @import url('https://fonts.googleapis.com/css?family=Bowlby+One+SC|Nanum+Gothic+Coding|Nanum+Gothic|Inconsolata|Quicksand&display=swap');
            
	*{box-sizing: border-box;
    font-family: 'Quicksand', sans-serif;}
	/* div{border:1px solid black;} */
    #msg{
        width: 250px;
        background-color: #d2cbdb;
        float: right;
    }
    #icon{
        float: left;
        width: 50px; height: 20px;
        color: #d8aa6a; background-color: #45457c;
        border-style: none;
        font-family: 'Quicksand', sans-serif;
    }
    #icon:hover{
        background-color: black;
        color: #ffba00;
        transition-duration: 0.4s;
			}
	#wrapper{
		width:300px;
		height:300px;
		right: 10px;
		position:fixed;
	}
	
	#contents{
        line-height:30px;
        background-color: #5b5b8e;
		width:100%;
		height:90%;
		overflow-y:auto;
	}
	#control{
		width:100%;
		height:10%;
	}
	#control>div{
		height:100%;
		float:left;
	}
	#input{width:100%;}
	#btn{width:20%;}
/*	#msg{width:100%;height:100%}*/
	#emo{width:100%;height:100%;}
    img, .con{
        width: 60px; height: 60px;
    }
    #conbox{
        display: none;
        position: absolute;
        background-color: #84848470;
    }
    .con{
        float: left;
    }
    .spanp{
        background-color: black;
        color: #ea86d7;
        border-radius: 5px;
        padding-left: 5px; padding-right: 5px; 
        margin-left: 5px;
    }
</style>
</head>
<body>
	<div id=wrapper>
		<div id=conbox>
             <button id="close">X</button>
             <div class=con><img src="icon/he.png"></div>
             <div class=con><img src="icon/he3.png"></div>
             <div class=con><img src="icon/he3.png"></div>
             <div class=con><img src="icon/muzi.gif"></div>
        </div>
		<div id=contents></div>
		<div id=controls>
			<div id=input>
			    <button id=icon>ICON</button>
				<div contenteditable="true" id="msg"></div>
			</div>
		</div>
	</div>
	
	<script>
		function updateScroll(){
		    var element = document.getElementById("contents");
		    element.scrollTop = element.scrollHeight;
		}
		
		var ws = new WebSocket("ws://192.168.60.34:8080/WebChat/chat.do"); // 클라이언트가 보게 될 화면
								// 이 url이랑 내가 접속할 때도 이 url이랑 일치해야 정상 작동
		ws.onopen = function(e) {
		}
		ws.onclose = function(e) {
		}
		
		
		ws.onmessage = function(e) {
			var line = $("<span class=spanp></span><br>");
			line.append(e.data);
			$("#contents").append(line);
			updateScroll();	
		}

//		$("#send").on("click", function() { // 보낼 때 send 받을 때 onmessage
//			ws.send($("#msg").val());
//			$("#msg").val("");
//			
//		})
		
		///////////////////////////////////////
		
		$(function(){
                $("#msg").on("keydown",function(e){
                    if (e.which == 13 && e.shiftKey == false) {
//                        var content = $("<div>" + $("#chat").html() + "</div>");
//                        $(content.hide());
                        ws.send($("#msg").html());
				$("#msg").html("");
				return false;
                    }
                });

                
                $("#icon").on("click",function(){
                    $("#conbox").slideDown(500);
                })

                $("#conbox img").on("click",function(){
                    var conName = $(this).attr("src");
                    $("#conbox").slideUp(500);
                    var img = $(this).clone();
                    $("#msg").append(img);
                })
                $("#close").on("click",function(){
                    $("#conbox").slideUp(500);
                })
            })
		
	
	</script>
</body>
</html>