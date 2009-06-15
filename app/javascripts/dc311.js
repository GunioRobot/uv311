//add your js code here

jQuery(document).ready(function() {
  // jQuery("#issue").autocomplete(autocomplete);
  jQuery('a[rel*=facebox]').facebox();
  
  
  // handles the select form toggeling 
  $('#type_id').change(function(){

    var id=$(this).val();
    var hidden=$('#prompt_id').parent(); 
     
     $.getJSON('/issues/attributes/'+id,
             function(data){
               $('#prompt_id').empty()              //clear service type first
               if(data.length != 0){                //if the return is empty hide the service type
                   if(hidden) $('#prompt_id').parent().removeClass('hide')
                   $.each(data, function(i,item){ 
                     $('#prompt_id').append('<option value="'+item.service_type_attribute.id+'">'+item.service_type_attribute.prompt+'</option>')
                    });
                 } else {
                   $('#prompt_id').parent().addClass('hide')
                 }
             });
      })

})


// sprocketize -I app/javascripts \
// -I vendor/sprockets/jquery/src \
// -I vendor/sprockets/facebox/src \
// -I vendor/sprockets/autocomplete/src \
// -I vendor/sprockets/servicetypes/src \
// --asset-root=public \
// app/javascripts/*.js > public/sprockets.js


// $('#issue').keypress(function(e){ console.log('asdffsd') }) 
function cl(v){console.log(v)}
$('#issue').live('click',function(){$(this).val("");})


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


$("#issue").keypress(function (e) {
      if (e.which == 32 || (65 <= e.which && e.which <= 65 + 25)
                        || (97 <= e.which && e.which <= 97 + 25)) {
        console.log('asdfasdf')
        var c = String.fromCharCode(e.which);
        
        $("p").append($("<span/>"))
              .children(":last")
              .append(document.createTextNode(c));
              
      } else if (e.which == 8) {
        // backspace in IE only be on keydown
        $("p").children(":last").remove();
      }
      $("div").text(e.which);
    });


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