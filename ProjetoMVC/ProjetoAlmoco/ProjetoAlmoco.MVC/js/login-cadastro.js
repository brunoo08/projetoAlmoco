$(document).ready(function(){
    $("#main .bt-cadastro button").click(function(){
      $('#main .box').addClass('move');
      $("#main .bt-login button").removeClass('active');
      $(this).addClass('active');
  
    });
    
    $("#main .bt-login button").click(function(){ 
      $('#main .box').removeClass('move');
      $("#main .bt-cadastro button").removeClass('active');
      $(this).addClass('active');
    });
});