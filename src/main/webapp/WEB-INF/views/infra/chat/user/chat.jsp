<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<head>

	<title>My chatList</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link rel="stylesheet" href="/resources/images/assets/css/main.css" />
	<noscript><link rel="stylesheet" href="/resources/images/assets/css/noscript.css" /></noscript>
	<link rel="icon" href="/resources/images/images/favicon.ico">

	<style>
		div	{
			/* border: solid 1px orange; */
		}
	    .card {
            height: 700px;
            border-radius: 15px !important;
            background-color: rgba(0, 0, 0, 0.4) !important;
        }

        .contacts_body {
            padding: 0.75rem 0 !important;
            overflow-y: auto;
            white-space: nowrap;
            background: #1F2122;
        }

        .msg_card_body {
            overflow-y: auto;
            background: #1F2122;
        }

        .card-header {
            border-radius: 15px 15px 0 0 !important;
            border-bottom: 0 !important;
            background: #1F2122;
        }

        .card-footer {
            border-radius: 0 0 15px 15px !important;
            border-top: 0 !important;
            background: #1F2122;
        }

        .container {
            align-content: center;
        }

        .search {
            border-radius: 15px 0 0 15px !important;
            background-color: rgba(0, 0, 0, 0.3) !important;
            border: 0 !important;
            color: white !important;
        }

        .search:focus {
            box-shadow: none !important;
            outline: 0px !important;
        }

        .type_msg {
            background-color: rgba(0, 0, 0, 0.3) !important;
            border: 0 !important;
            color: white !important;
            height: 60px !important;
            overflow-y: auto;
        }

        .type_msg:focus {
            box-shadow: none !important;
            outline: 0px !important;
        }

        .attach_btn {
            border-radius: 15px 0 0 15px !important;
            background-color: rgba(0, 0, 0, 0.3) !important;
            border: 0 !important;
            color: white !important;
            cursor: pointer;
        }

        .send_btn {
            border-radius: 0 15px 15px 0 !important;
            background-color: rgba(0, 0, 0, 0.3) !important;
            border: 0 !important;
            color: white !important;
            cursor: pointer;
        }

        .search_btn {
            border-radius: 0 15px 15px 0 !important;
            background-color: rgba(0, 0, 0, 0.3) !important;
            border: 0 !important;
            color: white !important;
            cursor: pointer;
        }

        .contacts {
            list-style: none;
            padding: 0;
        }

        .contacts li {
            width: 100% !important;
            padding: 5px 10px;
            margin-bottom: 15px !important;
        }

        .active {
            background-color: #27292A;
        }

        .user_img {
            height: 60px;
            width: 60px;
            border: 1.5px solid #f5f6fa;
        }

        .img_cont {
            display: flex;
            align-items: center;
            position: relative;
            height: 70px;
            width: 70px;
        }

        .chat_product_img {
            border-radius: 5px;
            align-items: center;
            position: relative;
            height: 50px;
            width: 50px;
        } 

        .chat_product_info {
            margin-top: 10px;
            margin-bottom: auto;
            margin-left: 0px;
            overflow: hidden;
            white-space: nowrap;
        }

        .chat_product_info .title {
            font-size: 12px;
            color: white;
        }

        .chat_product_info .status {
            font-size: 12px;
            color: white;
            font-weight: bold;
            margin-right: 5px;
        }

        .chat_product_info p {
            font-size: 12px;
            color: rgba(255, 255, 255, 0.6);
        }

        .msg_cotainer {
            margin-top: auto;
            margin-bottom: auto;
            margin-left: 10px;
            border-radius: 25px;
            background-color: #585858;
            color: white;
            padding: 10px 15px 10px 15px;
            position: relative;
        }

        .msg_cotainer_send {
            margin-top: auto;
            margin-bottom: auto;
            margin-right: 10px;
            border-radius: 25px; 
            background-color: #FAB150;
            color: black;
            padding: 10px 15px 10px 15px;
            position: relative; 
        }

        .msg_time {
            position: absolute;
            left: 0;
            margin-left: 10px;
            min-width: 100px;
            bottom: -20px;
            color: rgba(255, 255, 255, 0.5);
            font-size: 10px;
        }

        .msg_time_send {
            position: absolute;
            right: 0;
            margin-right: 10px;
            min-width: 100px;
            bottom: -20px;
            color: rgba(255, 255, 255, 0.5);
            font-size: 10px;
            text-align:end; 
        }

        .msg_head {
            position: relative;
            background: #1F2122;
        }

        /* width */

        ::-webkit-scrollbar {
            width: 10px;
        }

        /* Track */

        ::-webkit-scrollbar-track {
            background: #f1f1f1;
        }

        /* Handle */

        ::-webkit-scrollbar-thumb {
            background: #888;
        }

        /* Handle on hover */

        ::-webkit-scrollbar-thumb:hover {
            background: #555;
        }

        @media(max-width: 576px) {
            .contacts_card {
                margin-bottom: 15px !important;
            }
        }
        
        .room:hover {
        	background: #FAB150; 
        	border-radius: 10px;
        }
	</style>
</head>
<body> 
	<!-- header -->
	<%@include file="/resources/include/header.jsp" %>
	 
	<div class="container" style="margin: 0px; margin-left: auto; margin-right: auto; margin-top: 5%;">     
        <div class="page-content" style="width: 100%; height: 600px;">
        	<form id="mainForm" method="POST">
        		<input type="hidden" id="selectedRoom">
	        	<div class="row justify-content-center h-100"> 
	                <div class="col-md-4 col-xl-3 chat">
	                    <div class="card mb-sm-3 mb-md-0 contacts_card" style="height: 500px;">
	                        <!-- <div class="card-header" style="display: none;">
	                            <div class="input-group">
	                                <input type="text" placeholder="??????????????? Seq??? ??????????????????." id="cuMember" name="cuMember" class="form-control search">
	                                <span class="input-group-text search_btn" onclick="addChat()"><i class="fa-solid fa-plus"></i></span>
	                            </div>
	                        </div> -->
	                        <div class="card-header" style="width: 230px;"></div>
	                        <div class="card-body contacts_body" style="width: 230px; height: 500px;"> 
	                            <ui class="contacts" id="chatList">
	                            
	                            	<c:forEach items="${list }" var="list" varStatus="status">
	                            		
										<li class="room" id="${list.chatSeq}" onclick="selectChatRoom(${list.chatSeq})" style="cursor: pointer;">
		                                    <div class="d-flex bd-highlight">
		                                        <div class="img_cont">
		                                            	<!-- ?????? path ??? uuidname ??? ????????? dto field??? ?????? ?????? -->
		                                            <img src="
														<c:if test = "${list.path ne null}">
															${list.path}${list.uuidName}
														</c:if>
                               							 " class="rounded-circle user_img">
		                                        </div>
		                                        <div class="chat_product_info">
		                                            <span class="status"><c:out value="${list.id }"/></span>
	                                 				<p>click here!</p>
		                                        </div>
		                                    </div>
		                                </li>
	                            			
	                            	</c:forEach>
	                             
	                            </ui>
	                        </div>
	                        <div class="card-footer" style="width: 230px;"></div>
	                    </div>
	                </div>
	                <div class="col-md-8 col-xl-6 chat" style="width: 600px; height: 500px;"> 
	                    <div class="card" style="width: 600px; height: 500px;">	                       
	                        <div id="chatBox" class="card-body msg_card_body" style="width: 580px; height: 500px;">  
	
													<!-- ?????? ????????? ?????? -->
	
	                        </div>
	                        <div class="card-footer" style="width: 580px;">
	                            <div class="input-group" style="width: 100%;">
	                                <span class="input-group-text attach_btn"><i class="fas fa-paperclip"></i></span>
	                                <textarea id="chatMessage" class="form-control type_msg"
	                                    placeholder="???????????? ??????????????????."></textarea>
	                                <span class="input-group-text send_btn" id="sendBtn"><i class="fas fa-location-arrow"></i></span>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	          
	
	            
            </form>
        </div>
	</div>
	
	<!-- footer -->
	<%@include file="/resources/include/footer.jsp"%>
	
	<!-- scripts -->
	<script src="https://kit.fontawesome.com/63aa3074b3.js" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script src="/resources/images/assets/js/jquery.min.js"></script>
	<script src="/resources/images/assets/js/jquery.scrollex.min.js"></script>
	<script src="/resources/images/assets/js/jquery.scrolly.min.js"></script>
	<script src="/resources/images/assets/js/browser.min.js"></script>
	<script src="/resources/images/assets/js/breakpoints.min.js"></script>
	<script src="/resources/images/assets/js/util.js"></script>
	<script src="/resources/images/assets/js/main.js"></script>

	<script type="module">

	import { initializeApp } from "https://www.gstatic.com/firebasejs/9.12.1/firebase-app.js";
	
  //Firebase ?????????????????? ????????? ?????? ??????
	const firebaseConfig = {
  		apiKey: "AIzaSyATE23PoPh-dBRfUr-BuEUFStGH9pOqiPw",
  		authDomain: "my-chat-b7ed2.firebaseapp.com",
  		databaseURL: "https://my-chat-b7ed2-default-rtdb.firebaseio.com",
  		projectId: "my-chat-b7ed2",
  		storageBucket: "my-chat-b7ed2.appspot.com",
  		messagingSenderId: "504083711938",
  		appId: "1:504083711938:web:d01b1c101682c1b4a4b85b"
	};		
	// Initialize Firebase
	const app = initializeApp(firebaseConfig);

	import { getDatabase, ref, set, onValue }	from "https://www.gstatic.com/firebasejs/9.12.1/firebase-database.js";
	
	const db = getDatabase();

	var insMsg = document.getElementById("chatMessage");
	insMsg.addEventListener('keyup',enterKey);

	var sendBtn = document.getElementById("sendBtn");
	sendBtn.addEventListener('click',sendMessage);

	function enterKey() {
		
		var keycode = event.keyCode;
		
		if(keycode == 13) //Enter
			sendMessage();
	};
		
	function sendMessage(){

		var room = $("#selectedRoom").val();
	
		if(room == "") {
			//???????????? ???????????? ?????? ????????? ????????? ???????????? ?????????
			$("#chatMessage").val("");
			return;
		}

		var message = $("#chatMessage").val();

		//????????? ????????? ?????????
		$("#chatMessage").val("");
		
		//??? ????????? ???????????? ???????????? ?????? ????????? ?????? ??? ???????????? ?????? ?????????
		$("#chatBox").html(""); 	
	
		//??? ???????????? Firebase / realtime database / chat / ?????????seq / ????????? / ????????? / ???????????? ???????????????.
		set(ref(db,'chat/'+room+'/'+getnow()+'/'+${sessSeq} ),{
			Masseage: message
		})

		//???????????? ?????? ????????? ??????
		$("#chatBox").scrollTop($("#chatBox")[0].scrollHeight);
	};
	
	function readMessage(e){

		const room = e.id; 
		$("#selectedRoom").val(room);
		
		const dbRef = ref(db, 'chat/'+room);
		const txt = "";
        onValue(dbRef,(snapshot) => {
            if(snapshot.key == $("#selectedRoom").val()){
				//????????? ????????? ?????? ????????? ????????? ?????? ????????????
				$("#chatBox").html("");
                snapshot.forEach((childSnapshot) => {
                    const timetable = childSnapshot.key;
                    console.log(timetable); 
                    onValue(ref(db,'chat/'+room+'/'+timetable),(snapshot2) => {
                        snapshot2.forEach((childSnapshot2) => {
                            const writer = childSnapshot2.key
                            console.log(writer);
                        
                            onValue(ref(db,'chat/'+room+'/'+timetable+'/'+writer),(snapshot3) => {
                                snapshot3.forEach((childSnapshot3) => {
                                        const message = childSnapshot3.val()
                                        console.log(message);
                                            
                                        var txt = '';
                                        txt += '<div class="d-flex mb-4 justify-content-';
                                        txt += writer == ${sessSeq} ? 'end' : 'start';
                                        txt += '">';
                                        txt += '<div class="msg_cotainer';
                                        txt += writer == ${sessSeq} ? '_send' : '';
                                        txt += '">';
                                        txt += message;
                                        txt += '<span class="msg_time';
                                        txt += writer == ${sessSeq} ? '_send' : '';
                                        txt += '">';
                                        txt += getTimeFormat(timetable);
                                        txt += '</span>';
                                        txt += '</div>';
                                        txt += '</div>';

                                        $("#chatBox").append(txt);
                                        $("#chatBox").scrollTop($("#chatBox")[0].scrollHeight);
                                    });
                                }); 
                            }); 
                        });
                    });
                 }		
            });	
	}

	$(".room").click(function(){
		readMessage(event.currentTarget);
				
	}); 
	function getTimeFormat(timetable){
		//221105080634 
		return timetable.substring(0,2)+"-"+timetable.substring(2,4)+"-"+timetable.substring(4,6)+" "+timetable.substring(6,8)+":"+timetable.substring(8,10)+":"+timetable.substring(10,12);	
	}

	</script>
	
	<script>
				
		getnow = function() {
				
			var timestamp = new Date().getTime();
			
			var date = new Date(timestamp); //?????????????????? ????????? ?????? Date ?????? ??????
			
			var year = date.getFullYear().toString().slice(-2); //?????? ?????? ?????????
			var month = ("0" + (date.getMonth() + 1)).slice(-2); //??? 2?????? (01, 02 ... 12)
			var day = ("0" + date.getDate()).slice(-2); //??? 2?????? (01, 02 ... 31)
			var hour = ("0" + date.getHours()).slice(-2); //??? 2?????? (00, 01 ... 23)
			var minute = ("0" + date.getMinutes()).slice(-2); //??? 2?????? (00, 01 ... 59)
			var second = ("0" + date.getSeconds()).slice(-2); //??? 2?????? (00, 01 ... 59)
			
			return year+month+day+hour+minute+second;
		};
	
		selectChatRoom = function (roomNo) {
            
            var roomArray = $("li[name=room]");
            roomArray.each(function (index, item) {
                if (index != roomNo - 1)
                    item.classList.remove("active");
                else
                    item.classList.add("active");
            });

        };
        

		addChat = function(){
			
			$.ajax({
				url: '/chat/insChatAjax'
				,type: 'POST'
				,datatype:'json'
				,data:{
					cuMember : $("#cuMember").val()
				}
				,success:function(result){ 
					if(result.rt=="success"){
						 
						$("#cuMember").val("");
						var txt="";
						txt+='<li class="room" id="';
						txt+=result.newChat.chatSeq;
						txt+='" onclick="selectChatRoom(';
						txt+=result.newChat.chatSeq;
						txt+=')">';
						txt+='<div class="d-flex bd-highlight">';
						txt+='<div class="img_cont">';
						txt+='<!-- ?????? path ??? uuidname ??? ????????? dto field??? ?????? ?????? -->';
						txt+='<img src="';
						if(result.newChat.path != null)
						{
							txt+=result.newChat.path + result.newChat.uuidName;
						}
						txt+='" class="rounded-circle user_img">';
						txt+='</div>';
						txt+='<div class="chat_product_info">';
						txt+='<span class="status">';
						txt+=result.newChat.id;
						txt+='</span>';
						txt+='<p>TEST TEXT FIELD</p>';
						txt+='</div>';
						txt+='</div>';
						txt+='</li>';
						$("#chatList").prepend(txt);   
					}else{
						alert("fail..!");
					}
				}
				,error:function(){
					alert("ajax error..!");
				}
			});
			
		}
    </script>
</body>
</html>