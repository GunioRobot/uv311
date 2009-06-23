//add your js code here

jQuery(document).ready(function() {
  // jQuery("#issue").autocomplete(autocomplete);
  jQuery('a[rel*=facebox]').facebox();
  
  
  // handles the select form toggeling 
  $('#issue_service_request').change(function(){
    var id=$(this).val();

	$.ajax({
	   url: '/issues/attributes/'+id,
	   dataType: "html",
	   success: function(data){
		   $('#custom_form_id').replaceWith(data);
	   }	
	 });
  })
})
 
 
$('#fb_send').live('click',function(){ sendToFacebook.send() })


sendToFacebook={
  send:function(){
    issue_description=$('#description').html();
    img_url=$('#description').attr('rel');
    the_url=(img_url == '/pictures/small/missing.png') ? the_url = 'http://easy311.org/images/logo.gif' : img_url;

    FB.ensureInit(function() {
  	var template_stuff = {"images":[{"src":the_url, "href":"http://easy311.org"}]}; 

  	var body_general = "Description: " + issue_description
  	var user_message_prompt = "Lets make DC a better place to live!";
  	var x = FB.Connect.showFeedDialog(93980376023, template_stuff, null, body_general, null, FB.RequireConnect.require, null);
  	});
  	
  }
}
 

// sprocketize -I app/javascripts \
// -I vendor/sprockets/jquery/src \
// -I vendor/sprockets/facebox/src \
// -I vendor/sprockets/autocomplete/src \
// -I vendor/sprockets/servicetypes/src \
// --asset-root=public \
// app/javascripts/*.js > public/sprockets.js


// $('#issue').keypress(function(e){ console.log('asdffsd') }) 




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


$("#issue").live("keypress", function (e) {
      // console.log($(this).val() )
      var el=$(this)
      el.addClass('load')

      $.ajax({
         type: "POST",
         url: '/issues/issues_with_address/',
         data: { address: el.val() },
         fiModified:true,
         complete: function(xmlHttp){ 
           el.removeAttr('class')  
          $('#issues').html(xmlHttp.responseText)

       }
      });
    })
    .live('click',function(){$(this).val("");})


// EXAMPLE:
// $.ajax({
//  type: "GET",
//  url: '/issues/attributes/'+id,
//  data: { authenticity_token: window._token },
//  complete: function(xmlHttp){ 
//  console.log(xmlHttp.responseText)
//  }
// });







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