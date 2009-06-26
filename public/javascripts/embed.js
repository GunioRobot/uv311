// load

function uv311_loadScript(url) {
  var script = document.createElement('script');
  script.setAttribute('type', 'text/javascript');
  script.setAttribute('src', url);
  document.body.appendChild(script);
}
 
function uv311_loadStylesheet(url) {
  var css = document.createElement('link');
  css.setAttribute('rel', 'stylesheet');
  css.setAttribute('href', url);
  document.body.appendChild(css);
}
 
uv311_loadScript("http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js");
uv311_loadScript("http://www.easy311.org/javascripts/jquery.js");
uv311_loadScript("http://www.easy311.org/javascripts/facebox.js");
uv311_loadStylesheet("http://www.easy311.org/stylesheets/facebox.css");
uv311_loadStylesheet("http://www.easy311.org/stylesheets/embed.css");
document.getElementById('uv311').innerHTML='<div id="uv311"><a href="easy311.html" rel="facebox">easy311.org</a><div id="uv311prompt" style="display: none"><p>I want to...</p><input type="text" id="uv311searchstring"><input type="button" id="uv311submit" value="search"></div><div id="uv311searchresults"></div></div></div>';
 
window.onload = function() {
  $("#uv311submit").click(function() {
    alert("hi");
    return false;
  });  
};

window.onload = function() {    
	jQuery(document).ready(function($) {
      $('a[rel*=facebox]').facebox({
        loading_image : 'loading.gif',
        close_image   : 'closelabel.gif'
      }) 
    })
};

