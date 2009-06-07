//add your js code here

$("p").live("click", function(){
  $(this).after("<p>Another paragraph!</p>");
});
