jQuery(window).scroll(function() {
    if (jQuery(this).scrollTop() > 400){  
        jQuery('.page-header').addClass("sticky");
     }
     else{
        jQuery('.page-header').removeClass("sticky");
     }
   });