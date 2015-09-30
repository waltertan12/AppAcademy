(function(root) {
  if (typeof Asteroids === "undefined") {
    root.Asteroids = {};
  }

  var Util = root.Asteroids.Util;

  var GameView = root.Asteroids.GameView = function (ctx, image) {
    this.Game = new root.Asteroids.Game();
    this.context = ctx;
    this.image = image;
  };

  GameView.prototype.start = function () {
    var gameView = this;
    this.bindKeyHandlers();

    setInterval(function () {
      gameView.Game.draw(gameView.context);
      gameView.Game.step();
    }, 1000 / 60);
  };

  GameView.prototype.bindKeyHandlers = function() {
    var gView = this;
    key('s', function() {gView.Game.ship.power([0, 1])});
    key('w', function() {gView.Game.ship.power([0, -1])});
    key('d', function() {gView.Game.ship.power([1, 0])});
    key('a', function() {gView.Game.ship.power([-1, 0])});
    key('left', function() {
      gView.Game.ship.rotate("left");
    });
    key('right', function() {
      gView.Game.ship.rotate("right");
    });
    key('space', function() {
      gView.Game.ship.fireBullet();
    });
  };
})(this);
