var main = function() {


    // $(document).keydown(function(key){
    //   if(key === 37) {
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


  function leftRight(divL,posL) {
    
    for(var i = posL; i < 1100; i+=5) {
      var j = i + "px";
      divL.animate({left: j}, 35);
    } 
    function toCont() {
      for(var i = 1100; i > 100; i-=5) {
        var j = i + "px";
        divL.animate({left: j}, 35);
      } for(var i = 100; i < 1100; i+=5) {
        var j = i + "px";
        divL.animate({left: j}, 35);
      }
    }
    if (i === 1100) {
      toCont();
      if (i === 1100) {
      toCont();
      } 
    } 
    
  }

// call left moving divs from starting positions defined in css

leftRight($('#one1'),100);
leftRight($('#one3'),600);
leftRight($('#two3'),200);
leftRight($('#two1'),450);
leftRight($('#three3'),900);

// to make the divs move Right to Left - same question as above- how do I make this keep going?

  function rightLeft(divR,posR) {
    for(var i = posR; i > 100; i-=5) {
      var j = i + "px";
    divR.animate({left: j}, 35);
    } for(var i = 100; i < 1100; i+=5) {
      var j = i + "px";
    divR.animate({left: j}, 35);
    } 
  }
// call right moving divs from starting positions defined in css
rightLeft($('#one2'),200);
rightLeft($('#two2'),350);
rightLeft($('#three2'),700);
rightLeft($('#three1'),750);

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
        
      if (b1 < y2 || y1 > b2 || r1 < x2 || x1 > r2) return false;
      return true;
      
// to use that collision script to make things happen

// why doesn't the below line do anything?
      if (b1 < y2 || y1 > b2 || r1 < x2 || x1 > r2) console.log("false");
      console.log("true");
    }

      // why doesn't this alert me when player one and the div noted collide?!
          var one = collision($('#player'), $('#one1'));
          console.log(one);    
          if (one) { 
            alert("hit");
          }

       
        //   if (
        //     collision($('#player'),$('#one1')) ||
        //     collision($('#player'),$('#one2')) ||
        //     collision($('#player'),$('#one3')) ||
        //     collision($('#player'),$('#two1')) ||
        //     collision($('#player'),$('#two2')) ||
        //     collision($('#player'),$('#two3')) ||
        //     collision($('#player'),$('#three1')) ||
        //     collision($('#player'),$('#three2')) ||
        //     collision($('#player'),$('#three3'))
        //     ) { alert("hit");
        // }



window.setInterval(function() {
    $('#result1').text(collision($('#player'), $('#one1')));
}, 100);


}

$(document).ready(main);