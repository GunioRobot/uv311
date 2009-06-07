//add your js code here

jQuery(document).ready(function() {
     jQuery('a[rel*=facebox]').facebox()
       jQuery('a[rel*=vote]').bind('click', function() {
           $.ajax({
             type: 'POST',
             url: this.attr('href'),
             success: function(){console.log('good boy')}
           })
           
           return false
      })
})


