//add your js code here

$("p").live("click", function(){
  $(this).after("<p>Another paragraph!</p>");
});

jQuery(document).ready(function() {
  jQuery("#issue").autocomplete(autocomplete);
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

