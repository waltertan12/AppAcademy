(function(root) {
  if (typeof Asteroids === "undefined") {
    root.Asteroids = {};
  }

  var Util = root.Asteroids.Util;

  var Asteroid = root.Asteroids.Asteroid = function (pos, game) {
    root.Asteroids.MovingObject.call(this,
      {
        pos: pos["pos"],
        vel: Util.randomVec(10),
        color: Asteroid.COLOR,
        radius: Asteroid.RADIUS
      },
      game
    );

  };

  Util.inherits(Asteroid, root.Asteroids.MovingObject);
  Asteroid.COLOR = 'pink';
  Asteroid.RADIUS = 20;

  Asteroid.prototype.collideWith = function(otherObject) {
    if (this.isCollideWith(otherObject)) {
      if (otherObject instanceof root.Asteroids.Ship) {
        this.game.ship.relocate();
        this.game.remove(this);
      } //else {
        //this.game.remove(otherObject);
      //}
    }
  };

})(this);
