/* Author:

*/
 $(document).ready(function(){
    if(!("WebSocket" in window)) {
      alert("Sorry, the build of your browser does not support WebSockets. Please use latest Chrome or Webkit nightly");
      return;
    }
 
     ws = new WebSocket("ws://localhost:8080/");
     ws.onmessage = function(evt) { 
	 data = evt.data;      
	 $('#myTable').prepend('<tr><td>' + data + '</td></tr>');
     }
    ws.onclose = function() {
	alert("socket closed");
    };
     ws.onopen = function() {
	 //alert("connected...");
     };
 });
