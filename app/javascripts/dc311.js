//add your js code here

$("p").live("click", function(){
  $(this).after("<p>Another paragraph!</p>");
});

jQuery(document).ready(function() {
  jQuery("#issue").autocomplete(autocomplete);
  jQuery('a[rel*=facebox]').facebox();
  $('#issue').focus( (function() { $(this).val(""); }) );
})


$("a[rel*=vote]").live('click', function() {

var share=this;
$.ajax({
      type: "GET",
       url: this.href,
       data: { authenticity_token: window._token },
       complete: function(xmlHttp){ 
          count=parseFloat($(share).find("label").text())

          if (xmlHttp.status != 200) {
            $(share).find("label").text(count+1)
          }
          }
 });
              
     return false
})














// function uv311_loadScript(url) {
//   var script = document.createElement('script');
//   script.setAttribute('type', 'text/javascript');
//   script.setAttribute('src', url);
//   document.body.appendChild(script);
// }
// 
// function uv311_loadStylesheet(url) {
//   var css = document.createElement('link');
//   css.setAttribute('rel', 'stylesheet');
//   css.setAttribute('href', url);
//   document.body.appendChild(css);
// }
// 
// uv311_loadScript("http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js");
// uv311_loadStylesheet("http://uv311.org:3000/stylesheets/embed.css");
// document.getElementById('uv311').innerHTML='<div id="uv311"><a href="#" onclick="$(\'#uv311prompt\').fadeIn(\'fast\');">dc311.org</a><div id="uv311prompt" style="display: none"><p>I want to...</p><input type="text" id="uv311searchstring"><input type="button" id="uv311submit" value="search"></div><div id="uv311searchresults"></div></div></div>';
// 
// $(document).ready() = function() {  
//   $("#uv311submit").click(function() {
//     alert("hi");
//     return false;
//   });
//   //autocomplete is in service_types.js
//   $("#issue").autocomplete(autocomplete);
//   
// };