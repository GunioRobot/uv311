//add your js code here

$("p").live("click", function(){
  $(this).after("<p>Another paragraph!</p>");
});

jQuery(document).ready(function() {
  jQuery("#issue").autocomplete(autocomplete);
<<<<<<< HEAD:app/javascripts/dc311.js
     jQuery('a[rel*=facebox]').facebox();
       jQuery('a[rel*=vote]').bind('click', function() {
           $.ajax({
             type: 'POST',
             url: this.attr('href'),
             success: function(){console.log('good boy')}
           });
           
           return false;
      });
});
=======
  jQuery('a[rel*=facebox]').facebox()
})





$("a[rel=vote]").live('click', function() {
alert('asdfasf')
     $.ajax({
       type: 'POST',
       url: this.attr('href'),
       success: function(){console.log('good boy')}
     })
     
     return false
})












>>>>>>> 67e6ea7f9c1b091be81603d2fdfee7efd9b6793b:app/javascripts/dc311.js

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