(function(root) {
  if (typeof Asteroids === "undefined") {
    root.Asteroids = {};
  }

  var Util = root.Asteroids.Util;
  var MovingObject = root.Asteroids.MovingObject;
  var Bullet = root.Asteroids.Bullet;

  var Ship = root.Asteroids.Ship = function (pos, game) {
    MovingObject.call(this,
      {
        pos: pos["pos"],
        vel: Util.randomVec(0),
        color: Ship.COLOR,
        radius: Ship.RADIUS
      },
      game
    );
  };
  Ship.RADIUS = 15;
  Ship.COLOR  = 'blue';
  Util.inherits(Ship, MovingObject);

  Ship.prototype.relocate = function() {
    this.velocity = Util.randomVec(0);
    this.pos = this.game.randomPosition()["pos"];
  };

  Ship.prototype.power = function(impulse) {
    this.vel = [this.vel[0] + impulse[0], this.vel[1] + impulse[1]];
  };

  Ship.prototype.fireBullet = function () {
    var bullet = new Bullet(this.pos, [this.vel[0]*5, this.vel[1]*5], this.game);
    this.game.bullets.push(bullet);
  };

}) (this);
