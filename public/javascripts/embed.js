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
  document.getElementsByTagName("head")[0].appendChild(css);
}

function facebox_loadStylesheet(url) {
	var css = document.createElement('link');
	css.setAttribute('rel', 'stylesheet');
	css.setAttribute('media', 'screen');
	css.setAttribute('href', url);
	css.setAttribute('type', 'text/css');
	/*document.body.appendChild(css);*/
	document.getElementsByTagName("head")[0].appendChild(css);
}

uv311_loadScript("http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js");
uv311_loadScript("http://www.easy311.org/javascripts/jquery.js");
uv311_loadScript("http://www.easy311.org/javascripts/facebox.js");
facebox_loadStylesheet("http://www.easy311.org/stylesheets/facebox.css");
uv311_loadStylesheet("http://www.easy311.org/stylesheets/embed.css");
document.getElementById('uv311').innerHTML='<div style="width: 67px;"><a href="easy311.html" rel="facebox"><div id="uv311"></div></a></div>';

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

