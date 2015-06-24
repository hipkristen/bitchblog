var main = function() {


    // $(document).keydown(function(key){
    //   if(key.which === 37) {
    //     $('#player').animate({left:"-=10px"},'fast');
    //   }
    // });
    
// to move the player
  $(document).keydown(function(key){
    switch(parseInt(key.which,10)){
      case 37:
        $('#player').animate({left:"-=20px"},30);
        break;
      case 38:
        $('#player').animate({top:"-=20px"},30);
        break;
      case 39:
        $('#player').animate({left:"+=20"},30);
        break;
      case 40:
        $('#player').animate({top:"+=20px"},30);
        break;
    }
  })


// to make the divs move Left to Right - how can I make the "toCont" part keep continuing?

var blocker = function(div,posStart,directionStart,mover) {

    var directionNew = directionStart;
    var posNew = posStart;

    setInterval(function(){

      // this needs to go before the switch statement because otherwise the switch direction would just forever be left
      if(posNew >= $('body').width()) {
        directionNew = "right";
      } else if(posNew <=0) {
         directionNew = "left";
      }      
      // to designate the x-axis position on the page where this will be animated to go
      switch(directionNew) {
        case "left":
          posNew += mover;
          // console.log(posNew);
          break;
        case "right":
          posNew -= mover;
          // console.log(posNew);
          break;
      }

      var posNewPx = posNew + "px";
      div.animate({left: posNewPx},mover);

      }, 100);
};

new blocker($('#one1'),100,"left",35);
new blocker($('#one3'),600,"left",35);
new blocker($('#two3'),200,"left",35);
new blocker($('#two1'),450,"left",35);
new blocker($('#three3'),900,"left",35);

new blocker($('#one2'),200,"right",35);
new blocker($('#two2'),3500,"right",35);
new blocker($('#three2'),700,"right",35);
new blocker($('#three1'),750,"right",35);



// to detect a collision using jquery ui
  function collision(player,blocker) {
      var x1 = player.offset().left;
      var y1 = player.offset().top;
      var h1 = player.outerHeight(true);
      var w1 = player.outerWidth(true);
      var b1 = y1 + h1;
      var r1 = x1 + w1;
      var x2 = blocker.offset().left;
      var y2 = blocker.offset().top;
      var h2 = blocker.outerHeight(true);
      var w2 = blocker.outerWidth(true);
      var b2 = y2 + h2;
      var r2 = x2 + w2;
      
      // if (b1 < y2 || y1 > b2 || r1 < x2 || x1 > r2) {
      //   console.log("false");
      // } else {
      //   console.log("true");
      // }        
      
      if (b1 < y2 || y1 > b2 || r1 < x2 || x1 > r2) {
        return false;
      } else {  
        return true;
      }

    }


window.setInterval(function() {
// to detect collision
  if (
      collision($('#player'),$('#one1')) ||
      collision($('#player'),$('#one2')) ||
      collision($('#player'),$('#one3')) ||
      collision($('#player'),$('#two1')) ||
      collision($('#player'),$('#two2')) ||
      collision($('#player'),$('#two3')) ||
      collision($('#player'),$('#three1')) ||
      collision($('#player'),$('#three2')) ||
      collision($('#player'),$('#three3'))
      ) { 
// turn the background red for a flast when a hit happens, then turn it back to white - it's kind of flashy bc of how long each hit is.
          $('body').css("background-color","red");
          setTimeout(function(){
            $('body').css("background-color","white");  
          },50);
        } else {
          $('body').css("background-color","white");
        }
}, 100);



}

$(document).ready(main);