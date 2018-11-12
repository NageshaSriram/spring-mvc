<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>TataSky-ChatBot</title>

    <link href="<c:url value="/resources/libs/font-awesome.min.css" />" rel="stylesheet">
    <script src="<c:url value="/resources/libs/jquery-3.1.1.min.js" />"></script>
    <script src="<c:url value="/resources/libs/handlebars-v3.0.0.js" />"></script>
 	<script src="<c:url value="/resources/libs/list.min.js" />"></script>
    <link href="<c:url value="/resources/libs/bootstrap.min.css" />" rel="stylesheet">
    <script src="<c:url value="/resources/libs/bootstrap.min.js" />"></script>
<style type="text/css">
 

html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed, 
figure, figcaption, footer, header, hgroup, 
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
  margin: 0;
  padding: 0;
  border: 0;
  font-size: 100%;
  font: inherit;
  vertical-align: baseline;
}
/* HTML5 display-role reset for older browsers */
article, aside, details, figcaption, figure, 
footer, header, hgroup, menu, nav, section {
  display: block;
}
body {
  line-height: 1;
}
ol, ul {
  list-style: none;
}
blockquote, q {
  quotes: none;
}
blockquote:before, blockquote:after,
q:before, q:after {
  content: '';
  content: none;
}
table {
  border-collapse: collapse;
  border-spacing: 0;
}

@import url(https://fonts.googleapis.com/css?family=Lato:400,700);
*, *:before, *:after {
  box-sizing: border-box;
}

body {
  background: #C5DDEB;
  font: 14px/20px "Lato", Arial, sans-serif;
  padding: 40px 0;
  color: white;
}

.container {
  margin: 0 auto;
  width: 750px;
  border-radius: 5px;
}

.people-list {
  width: 260px;
  float: left;
}
.people-list .search {
  padding: 20px;
}
.people-list input {
  border-radius: 3px;
  border: none;
  padding: 14px;
  color: white;
  background: #6A6C75;
  width: 90%;
  font-size: 14px;
}
.people-list .fa-search {
  position: relative;
  left: -25px;
}
.people-list ul {
  padding: 20px;
  height: 770px;
}
.people-list ul li {
  padding-bottom: 20px;
}
.people-list img {
  float: left;
}
.people-list .about {
  float: left;
  margin-top: 8px;
}
.people-list .about {
  padding-left: 8px;
}
.people-list .status {
  color: #92959E;
}

.chat {
    float: left;
    background: #F2F5F8;
    border: 5px;
    color: #434651;
    border-radius: 3px;
    width: 100%;
}
.chat .chat-header {
    padding: 20px;
  /*  border-bottom: 2px solid white;*/
      /* fallback */
  background-color: #094a82;
  background-repeat: repeat-y;

  /* Safari 4-5, Chrome 1-9 */
  background: -webkit-gradient(linear, left top, right top, from(#094a82), to(#042546));

  /* Safari 5.1, Chrome 10+ */
  background: -webkit-linear-gradient(left, #042546, #094a82);

  /* Firefox 3.6+ */
  background: -moz-linear-gradient(left, #042546, #094a82);

  /* IE 10 */
  background: -ms-linear-gradient(left, #042546, #094a82);

  /* Opera 11.10+ */
  background: -o-linear-gradient(left, #042546, #094a82);
    color: white;
    border-radius: 3px 3px 0 0;
}
.chat .chat-header img {
    float: left;
    height: 50px;
    width: 50px;
    border-radius: 50%;
}
.chat .chat-header .chat-about {
    float: left;
    padding-left: 10px;
    margin-top: 16px;
}
.chat .chat-header .chat-with {
  font-weight: bold;
  font-size: 16px;
}
.chat .chat-header .chat-num-messages {
  color: #92959E;
}
.chat .chat-header .fa-star {
  float: right;
  color: #D8DADF;
  font-size: 20px;
  margin-top: 12px;
}
.chat .chat-history {
  padding: 30px 30px 20px;
  border-bottom: 2px solid white;
  overflow-y: scroll;
  height: 500px;
}
.chat .chat-history .message-data {
    margin-bottom: 15px;
    margin-top: 15px;
}
.chat .chat-history .message-data-time {
  color: #a8aab1;
  padding-left: 6px;
}
.chat .chat-history .message {
    color: white;
    padding: 18px 20px;
    line-height: 26px;
    font-size: 16px;
    border-radius: 7px;
    margin-bottom: 30px;
    min-width: 210px;
    position: relative;
}
.chat .chat-history .message:after {
  bottom: 100%;
  left: 7%;
  border: solid transparent;
  content: " ";
  height: 0;
  width: 0;
  position: absolute;
  pointer-events: none;
  border-bottom-color: #03a9f4;
  border-width: 10px;
  margin-left: -10px;
}
.chat .chat-history .my-message {
  background: #03a9f4;
}
.chat .chat-history .other-message {
  background: #758492;
}
.chat .chat-history .other-message:after {
  border-bottom-color: #758492;
  left: 93%;
}
.chat .chat-message {
  padding: 30px;
}
.chat .chat-message textarea {
  width: 100%;
  border: none;
  padding: 10px 20px;
  font: 14px/22px "Lato", Arial, sans-serif;
  margin-bottom: 10px;
  border-radius: 5px;
  resize: none;
}
.chat .chat-message .fa-file-o, .chat .chat-message .fa-file-image-o {
  font-size: 16px;
  color: gray;
  cursor: pointer;
}
.chat .chat-message button {
  float: right;
  color: #94C2ED;
  font-size: 16px;
  text-transform: uppercase;
  border: none;
  cursor: pointer;
  font-weight: bold;
  background: #F2F5F8;
}
.chat .chat-message button:hover {
  color: #75b1e8;
}

.online, .offline, .me {
  margin-right: 3px;
  font-size: 10px;
}

.online {
  color: #03a9f4;
}

.offline {
  color: #E38968;
}

.me {
  color: #758492;
}

.align-left {
  text-align: left;
}

.align-right {
  text-align: right;
}

.float-right {
  float: right;
}

.clearfix:after {
  visibility: hidden;
  display: block;
  font-size: 0;
  content: " ";
  clear: both;
  height: 0;
}
.a-href{
  text-decoration: none;
  color: #94C2ED;
}

.btn-chat {
    background: #fff!important;
    border: 1px solid #3eaaf4!important;
    color: #3eaaf4!important;
    border-radius: 20px!important;
    box-shadow: none!important;
    padding: 0 15px!important;
    text-decoration: none;
    margin-top: 5px !important;
}
.btn {
    margin: 0;
    display: inline-flex;
    justify-content: center;
    position: relative;
    padding: 0 14px;
    box-sizing: border-box;
    min-width: 64px;
    height: 42px;
    line-height: 40px;
    overflow: hidden;
    vertical-align: middle;
    border-radius: 2px;
    border: 2px solid transparent;
    font-family: 'SkyTextMedium',sans-serif;
    font-size: 15px;
    box-shadow: 0 2px 5px 0 rgba(0,0,0,.1), 0 2px 10px 0 rgba(0,0,0,.1);
    text-transform: none;
}
a.waves-effect, a.waves-light {
    display: inline-flex;
}
a:hover {
    color: #444;
    transition-property: background;
    transition-duration: .5s;
    transition-timing-function: ease;
}
a.waves-effect, a.waves-light {
    display: inline-block;
}
a:focus, a:hover {
    text-decoration: none;
}
.btn:hover {
    box-shadow: 0 3px 6px 0 rgba(0,0,0,.15),0 3px 12px 0 rgba(0,0,0,.15)!important;
}
  </style>
</head>
<body>

  <div class="container clearfix">
    <div class="chat">
      <div class="chat-header clearfix">
        <img src="https://images.cdn3.stockunlimited.net/clipart/customer-service_1549085.jpg" alt="avatar" />
        
        <div class="chat-about">
          <div class="chat-with">Chat Bot</div>
        <!--   <div class="chat-num-messages">already 1 902 messages</div> -->
        </div>
        <!-- <i class="fa fa-star"></i> -->
      </div> <!-- end chat-header -->
      
      <div class="chat-history">
        <ul>
          
        </ul>
        
      </div> <!-- end chat-history -->
      
      <div class="chat-message clearfix">
        <!-- <textarea name="message-to-send" id="message-to-send" placeholder ="Type your message" rows="3"></textarea>-->
        <div class="float-right">
          
          <a href="https://devdata.simplify360.com:9443/bmuwapi/configure/download" class="a-href downloader-btn"><i class="fa fa-download"></i> Download Chat</a> &nbsp;&nbsp;&nbsp;
          <a href="javascript:void(0);" class="a-href uploader-btn" ><i class="fa fa-upload"></i> Upload Excel</a>
          <div style="display: none;">
             <form id="form-upload" action="https://devdata.simplify360.com:9443/bmuwapi/configure/upload" enctype="multipart/form-data">
              <input name="file" id="fileupload"  type="file">
            </form>
          </div>

        </div>        
        
       <!--  <button>Send</button>-->

      </div> <!-- end chat-message -->
      
    </div> <!-- end chat -->
    
  </div> <!-- end container -->


<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" style="color: black;">Enter User Details</h4>
      </div>
      <div class="modal-body">
        <p>User Name</p>
        <input type="text" name="username" id="username"  placeholder="username" class="form-control">
      </div>
      <div class="modal-footer">
         <button type="button" class="btn btn-danger" id="submitDetails">Submit</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>

<script id="message-template" type="text/x-handlebars-template">
  <li class="clearfix">
    <div class="message-data align-right">
      <span class="message-data-time" >{{time}}, Today</span> &nbsp; &nbsp;
      <span class="message-data-name" >{{username}}</span> <i class="fa fa-circle me"></i>
    </div>
    <div class="message other-message float-right">
      {{messageOutput}}
    </div>
  </li>
</script>

<script id="message-response-template" type="text/x-handlebars-template">
  <li>
    <div class="message-data">
      <span class="message-data-name"><i class="fa fa-circle online"></i> Vincent</span>
      <span class="message-data-time">{{time}}, Today</span>
    </div>
    <div class="message my-message">
      {{response}}
    </div>
  </li>
</script>
<script id="message-options-template" type="text/x-handlebars-template">
    <li>
    <div class="message-data">
      <span class="message-data-name"><i class="fa fa-circle online"></i> Bot</span>
      <span class="message-data-time">{{time}}, Today</span>
    </div>
    <div class="message my-message">
       {{chatResponse.body}}
    </div>
     <div>
      {{#each chatResponse.options}}
        <a href="javascript:void(0);" data-msg="{{this}}" data-input="{{@index}}" class="btn btn-chat reply-msg waves-effect waves-light">{{this}}</a>
      {{/each}}
      </div>
  </li>
 
  
   
</script>


<script type="text/javascript">
var username;

$(function(){

    $(".uploader-btn").click(function(){
      $("#fileupload").click();
    });
 
   $("#fileupload").change(function(){
    var form = document.getElementById('form-upload');
    var fileInput = document.getElementById('fileupload');
    var file = fileInput.files[0];
    console.log(file);
    var formData = new FormData(form);

    formData.append('file', file);

    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            alert("File Uploaded successfully!!!");
        }else if(this.status==400 || this.status==404 || this.status==500){
            alert("Error Occured!! status: "+this.status+", "+ this.responseText);
        }
    };
    xhr.open('POST', form.getAttribute('action'), true);
    xhr.send(formData);

   });
   
   $(".downloader-btn").click(function(){
	  /*  var durl  = "download";
	   window.open(durl); */
	   
	  /*  var param={user:this.username,input:input};
	      $.ajax({
	        url: "download",
	        data: param,
	        success: function(response){
	        	window.location = response;
	        }
	      }); */
   });

});

    
(function(){

  var chat = {
    messageToSend: '',
    messageResponses: [
    ],
    username: 'Binit',
    setUserName: function(){
      this.username=this.$username.val();
      this.$modal.modal('hide');
      this.init();
    },
    openModal: function(){
      this.cacheDOM();
      this.$modal.modal('show');
      this.$submitDetails.on('click',this.setUserName.bind(this));
    },
    init: function() {
      this.cacheDOM();
      this.bindEvents();
      this.render();
      this.fetchResponse(1);
    },
    cacheDOM: function() {
      this.$chatHistory = $('.chat-history');
      this.$button = $('button');
      this.$textarea = $('#message-to-send');
      this.$chatHistoryList =  this.$chatHistory.find('ul');
      this.$replyMsg = $('.reply-msg');
      this.$submitDetails=$("#submitDetails");
      this.$modal=$("#myModal");
      this.$username=$("#username");
    },
    bindEvents: function() {

      this.$button.on('click', this.addMessage.bind(this));
      this.$textarea.on('keyup', this.addMessageEnter.bind(this));
      this.$replyMsg.on('click', this.replyMessage.bind(this));
     
    },
    unbindEvents: function() {
      this.$button.unbind('click');
      this.$textarea.unbind('keyup');
      this.$replyMsg.unbind('click');
    }
    ,
    render: function() {
      this.scrollToBottom();
      if (this.messageToSend.trim() !== '') {
        var template = Handlebars.compile( $("#message-template").html());
        var context = { 
          messageOutput: this.messageToSend,
          time: this.getCurrentTime(),
          username:this.username
        };

        this.$chatHistoryList.append(template(context));
        this.scrollToBottom();
        this.$textarea.val('');
        
        // responses
        var templateResponse = Handlebars.compile( $("#message-response-template").html());
        var contextResponse = { 
          response: this.getRandomItem(this.messageResponses),
          time: this.getCurrentTime()
        };
        
        // setTimeout(function() {
        //   this.$chatHistoryList.append(templateResponse(contextResponse));
        //   this.scrollToBottom();
        // }.bind(this), 1500);
        
      }
      
    },
    
    addMessage: function() {
      this.messageToSend = this.$textarea.val()
      this.render();         
    },
    addMessageEnter: function(event) {
        // enter was pressed
        if (event.keyCode === 13) {
          this.addMessage();
        }
    },
    scrollToBottom: function() {
       this.$chatHistory.scrollTop(this.$chatHistory[0].scrollHeight);
    },
    getCurrentTime: function() {
      return new Date().toLocaleTimeString().
              replace(/([\d]+:[\d]{2})(:[\d]{2})(.*)/, "$1$3");
    },
    getRandomItem: function(arr) {
      return arr[Math.floor(Math.random()*arr.length)];
    },
    replyMessage: function(object){
      console.log(object.target.dataset.msg);
      this.messageToSend = object.target.dataset.msg;
      this.render();  
      this.fetchResponse(object.target.dataset.input);
    },
    fetchResponse: function(input){
      var that=this;
      var param={user:this.username,input:input};
      $.ajax({
        url: "reply",
        data: param,
        success: function(response){
          response.time=that.getCurrentTime();
          var templateOptions = Handlebars.compile( $("#message-options-template").html());
          that.$chatHistoryList.append(templateOptions(JSON.parse(response)));
          that.scrollToBottom();
          that.cacheDOM();
          that.unbindEvents();
          that.bindEvents();
        }
      });
    }
    
  };
  
  chat.openModal();

})();

  </script>

</body>
</html>

