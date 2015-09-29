(function(root) {
  if (typeof Asteroids === "undefined") {
    root.Asteroids = {};
  }

  var Util = root.Asteroids.Util;
  var MovingObject = root.Asteroids.MovingObject;

  var Bullet = root.Asteroids.Bullet = function (pos, vel, game) {
    root.Asteroids.MovingObject.call(this,
      {
        pos: pos,
        vel: vel,
        color: Bullet.COLOR,
        radius: Bullet.RADIUS,
        isWrappable: false
      },
      game
    );

    this.isWrappable = false;
  };

  Util.inherits(Bullet, MovingObject);

  Bullet.COLOR = 'purple';
  Bullet.RADIUS = 2;

  Bullet.prototype.collideWith = function(otherObject) {
    if (this.isCollideWith(otherObject)) {
      if (otherObject instanceof root.Asteroids.Asteroid) {
        this.game.remove(this);
        this.game.remove(otherObject);
      }
    }
  };

})(this);
