<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Lady bug</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/ex/resources/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
  <link rel="stylesheet" href="/ex/resources/chatcss/styles.css" />

</head>
<body>
     <div class="container">
     <aside style="float:right; position: fixed; right: 5px; bottom: 130px; z-index: 1;  ">
	    <div id ="changechat">
	 		 
<div id ="change">
<div id="togglechat" style="background-color : #f4f5f7;  box-shadow: 0 30px 60px rgba(50, 50, 93, 0.25); width: 304px;height: 504px;">
	 <header class="header">
      <div class="header__header-column">
        <h1 class="header__title">Consult</h1>
      </div>
      <div class="header__header-column">
        <span class="header__icon">
          <i class="fas fa-cog"></i>
        </span>
      </div>
    </header>
    <main class="chats">
      <ul class="chats__list">
        <li class="chats__chat chat">
            <div id="chatgo"class="chats__chat friend friend--lg" onclick="button1_click()">
              <div class="friend__column">
                <i class="fas fa-headset" style="font-size:35px;color:black;"></i> 
                <div class="friend__content" style="padding-left: 20px;">
                  <span class="friend__name">
                    			상담하기
                  </span>
                  <span class="friend__bottom-text">
                    			365일 24시간운영.
                  </span>
                </div>
              </div>
              <div class="friend__column">
                <span class="chat__timestamp">
                  December 30
                </span>
              </div>
            </div>
        </li>
      </ul>
    </main>
    <nav class="nav" style="display: inline-block; margin-top: 350px;">
      <ul class="nav__list">
        <li class="nav__list-item">
          <a href="friends.html" class="nav__list-link">
            <i class="far fa-user"></i
          ></a>
        </li>
        <li class="nav__list-item">
          <a href="index.html" class="nav__list-link">
            <i class="fas fa-comment"></i>
          </a>
        </li>
        <li class="nav__list-item">
          <a href="find.html" class="nav__list-link">
            <i class="fas fa-search"></i>
          </a>
        </li>
        <li class="nav__list-item">
          <a href="more.html" class="nav__list-link">
            <i class="fas fa-ellipsis-h"></i>
          </a>
        </li>
      </ul>
    </nav>
</div>
</div>
	  	</div>
	</aside>
	<button type="button" id="chatbutton" class="btn btn-outline-light btn-lg btn_color" style="position: fixed; right: 5px; bottom: 20px; z-index: 2;"><i class='far fa-comment-dots' style='font-size:48px;color:black;-webkit-transform: scaleX(-1);'></i><span id="unread" class="badge badge-pill badge-danger" style="position: absolute;right: 11px;"></span></button>
	</div>
	    
    <script>
    
    	$(document).ready(function(){
    		  			
			  $("#chatbutton").click(function(){
			    $("#togglechat").fadeToggle();
			  });
			});
		
		function button1_click() {

			$.ajax({
		  	    url: "chat",
		  	  	cache: false
		   }).done(function (fragment) {
		         $("#change").replaceWith(fragment);
		    });
		}
		
		function buttonback_click() {

			$.ajax({
		  	    url: "chatindex",
		  	  	cache: false
		   }).done(function (fragment) {
		         $("#change").replaceWith(fragment);
		    });
		}
	</script>
	
		
	<script type="text/javascript">


  	

  	function addChat(chatName, chatContent, chatTime) {
  		$('#chatList').append('<li class="incoming-message message">' + 
  				'<div class="message__content">' +
  				'<span class="message__bubble">' +
  				chatContent +
  				'</span>' +
  				'<span class="message__author">'+
  				chatName +
  				'</span>' +
  				'</div>' +
  				'<div class="media-body">' +
  				' </li>');
  		$('#togglechat').scrollTop($('#togglechat')[0].scrollHeight);
  	}

  </script>

</body>
</html>