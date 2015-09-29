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
      //gameView.context.drawImage(gameView.image, 0, 0);

      gameView.Game.draw(gameView.context);
      //gameView.Game.moveAsteroids();
      gameView.Game.step();
    }, 1000 / 60);
  };

  GameView.prototype.bindKeyHandlers = function() {
    var gView = this;
    key('s', function() {gView.Game.ship.power([0, 1])});
    key('w', function() {gView.Game.ship.power([0, -1])});
    key('d', function() {gView.Game.ship.power([1, 0])});
    key('a', function() {gView.Game.ship.power([-1, 0])});
    key('space', function() {
      gView.Game.ship.fireBullet();
    });

  };

})(this);
