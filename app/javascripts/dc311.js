//add your js code here

$("p").live("click", function(){
  $(this).after("<p>Another paragraph!</p>");
});

$(document).ready() = function() {  
  //autocomplete is in service_types.js
  $("#issue").autocomplete(autocomplete);
  
};