(function () {
  if (typeof TTT === "undefined") {
    window.TTT = {};
  }

  var View = TTT.View = function (game, $el) {
    this.game = game;
    this.setupBoard($el);
    this.bindEvents();
  };

  View.prototype.bindEvents = function () {
    var view = this;
    $('.grid-item').on("click", function(event) {
      var currentTarget = event.currentTarget;
      var $currentTarget = $(currentTarget);
      var pos = $currentTarget.data("grid").pos;

      if (view.game.board.isEmptyPos(pos)) {
        view.makeMove($currentTarget);
        view.game.playMove(pos);
      } else {
        if (Math.random() > 0.5) {
          alert("oh no");
        } else {
          alert("stop...");
        }
      }

      if (view.game.winner() !== null) {
        console.log(view.game.winner());
        if (view.game.currentPlayer === 'o') {
          $('.winner').text("You're playing with the big boys, " + view.game.currentPlayer + ":(");
        } else {
          $('.winner').text("You're playing with the big boys, " + view.game.currentPlayer + "(");
        }
      }
    });
  };

  View.prototype.makeMove = function ($square) {
    $square.css({
      "background": "white"
    });
    $square.text(this.game.currentPlayer);
  };

  View.prototype.setupBoard = function ($el) {
    var $ul = $('<ul class="grid group"></ul>');
    $el.append($ul);
    var $grid = $(".grid");
    for(var i = 0; i < 3; i++){
      for(var j = 0; j < 3; j++) {
        $grid.append('<li class="grid-item" data-grid=\'{ "pos": [' +
                     i + ',' + j + '] }\'></li>');
      }
    }
  };


})();
