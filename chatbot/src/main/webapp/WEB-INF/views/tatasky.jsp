<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<script>
var userName = "${message}";
!function() {
  var t = window.s360 = window.s360 || [];
  if (!t.init) {
    if (t.invoked) return void (window.console && console.error && console.error("S360 snippet included twice."));
    t.invoked = !0,
    t.load = function(user, u) {
      var o = document.createElement("script");
      o.type = "text/javascript", o.async = !0, o.crossorigin = "anonymous"; o.src = u+"tatasky.js";
      var a,b;a= document.createAttribute("data-config"); a.value=user;b=document.createAttribute("data-url");b.value=u;
      o.setAttributeNode(a);o.setAttributeNode(b);
      var i = document.getElementsByTagName("script")[0];
      i.parentNode.insertBefore(o, i);
    };
  }
}();
s360.load(userName,"/chatbot/resources/tatasky/");
</script>