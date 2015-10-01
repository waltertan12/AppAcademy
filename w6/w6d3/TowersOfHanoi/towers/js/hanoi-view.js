(function () {
  if(typeof window.Hanoi === "undefined"){
    window.Hanoi = {};
  }

  var Hanoi = window.Hanoi.View = function (game, $el) {
    this.game = game;
    this.setupTowers($el);
    this.render($el);
    this.clickTower($el);
    this.startTower = null;
    this.endTower = null;
  };

  Hanoi.prototype.setupTowers = function($el) {
    for(var i = 0; i < 3; i++) {
      // $el.append('<ul class="tower" data-tower=\'{"pos": ' + i + '}\'></ul>');
      $el.append('<ul class="tower" id=\'tower-' + i + '\'></ul>');
    }
    for(i = 2; i > -1; i--) {
      $('ul').append("<li class='disc blank' id='" + i +"'></li>");
    }
  };

  Hanoi.prototype.render = function ($el) {
    var towers = this.game.towers;
    for (var i = 0; i < towers.length; i++) {
      for (var k = 0; k < 3; k++) {
          // $('#tower-0 #1')
        var $currentDisc = $('#tower-' + i + ' #' + k);
        $currentDisc.removeClass("blank");
        $currentDisc.removeClass("small");
        $currentDisc.removeClass("medium");
        $currentDisc.removeClass("large");

        if (towers[i][k] === 1) {
          $currentDisc.addClass("small");
        }
        else if (towers[i][k] === 2) {
          $currentDisc.addClass("medium");
        }
        else if (towers[i][k] === 3) {
          $currentDisc.addClass("large");
        }
        else if (towers[i][k] === 'undefined'){
          $currentDisc.addClass("blank");
        }
      }
    }
  };

  Hanoi.prototype.clickTower = function ($el) {
    var view = this;
    $(".tower").on("click", function (event) {
      var currentTarget = event.currentTarget;
      var $currentTarget = $(currentTarget);
      $currentTarget.addClass("tower-highlight");

      var towerID = $currentTarget.attr("id");
      if (view.startTower === null) {
        view.startTower = parseInt(towerID.slice(towerID.length-1));
      } else {
        view.endTower = parseInt(towerID.slice(towerID.length-1));

        view.game.move(view.startTower, view.endTower);

        $("#tower-" + view.startTower).removeClass('tower-highlight');
        $currentTarget.removeClass('tower-highlight');

        view.startTower = null;
        view.endTower = null;
        if (view.game.isWon()) {
          $('.winner').text("You're a big boy now :O");
        } else {
          $('.winner').text("");
        }
        view.render($el);
      }
    });
  };

})();
