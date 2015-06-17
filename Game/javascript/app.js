var main = function() {


    // $(document).keydown(function(key)){
    //   if(key === 37) {
    //     $('#player').animate({left:"-=10px"},'fast');
    //   }
    // });
    


  $(document).keydown(function(key){
    switch(parseInt(key.which,10)){
      case 37:
        $('#player').animate({left:"-=10px"},'fast');
        break;
      case 38:
        $('#player').animate({top:"-=10px"},'fast');
        break;
      case 39:
        $('#player').animate({left:"+=10"},'fast');
        break;
      case 40:
        $('#player').animate({top:"+=10px"},'fast');
        break;
    }
  });

// if(document.getElementByID !== "player") {
//    var blocker = $(this);
//    console.log(blocker);
//  }

    var blocker = $('div');
    var player = $('#player');

      var y1 = player.offset().top;
      var h1 = player.height();
      var b1 = y1 + h1;
      var x1 = player.offset().left;
      var w1 = player.width();
      var r1 = x1 + w1;
      var y2 = blocker.offset().top;
      var h2 = blocker.height();
      var b2 = y2 + h2;
      var x2 = blocker.offset().left;
      var w2 = blocker.width();
      var r2 = x2 + w2;

    console.log(y1, h1, "b1 = ", b1, x1, w1, "r1 =", r1, y2, h2,"b2 = ", b2, x2, w2,"r2 = ",r2);

      function collision(player, blocker) {
      var y1 = player.offset().top;
      var h1 = player.height();
      var b1 = y1 + h1;
      var x1 = player.offset().left;
      var w1 = player.width();
      var r1 = x1 + w1;
      var y2 = blocker.offset().top;
      var h2 = blocker.height();
      var b2 = y2 + h2;
      var x2 = blocker.offset().left;
      var w2 = blocker.width();
      var r2 = x2 + w2;
        
      if (b1 < y2 || y1 > b2 || r1 < x2 || x1 > r2) return false;
      return true;

      console.log(x1, y1, h1,w1, b1,r1,x2,y2,h2,w2,b2,r2);
    }

      console.log(collision(player,blocker));


}

$(document).ready(main);