var main = function() {

  // window.onload = function() {
   
  // removed this bc Steph taught me the better trick with "display: none" and "display: block" in .css
  // $('.lie').hide();
  	 
  // };


  $('.cost').click(function() {
    
    var thisSection = $(this);

    $('.costView').removeClass('current');
    $('.lie').hide();
    
    $(this).addClass('current');
    $(this).children('.costView').addClass('current')
    $(this).children('.lie').show();

    //$('.lie').hide(function(){
      //  thisSection.children('.lie').addClass('selected');
      //  thisSection.children('.costView').addClass('current');
    //});

    // $(this).children('.lie').toggleClass('selected');
    // $(this).children('.costView').toggleClass('current');

    // $(this).addClass('current');
    // $(this).children('.costView').addClass('current')
    // $(this).children('.lie').show();

  });

  <!---- trying to hide children when you click again on the current cost ---->
    



  $('.btn').click (function() {
  	var post = $('.lie-box').val();
  	$('<li>').text(post).prependTo('.posts');
  	$('.lie-box').val(' ');
  });



}

$(document).ready(main);