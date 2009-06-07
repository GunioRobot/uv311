//add your js code here

jQuery(document).ready(function() {
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