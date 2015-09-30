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
    this.angle = 0;
    this.setPoint(this.angle);
  };

  Ship.RADIUS = 15;
  Ship.COLOR  = 'blue';
  Util.inherits(Ship, MovingObject);

  Ship.prototype.move = function () {
    this.pos[0] += this.vel[0];
    this.pos[1] += this.vel[1];
    this.point[0] += this.vel[0];
    this.point[1] += this.vel[1];

    if (this.isWrappable) {
      this.pos = this.game.wrap(this.pos);
    }
  };

  Ship.prototype.rotate = function(direction) {
    if (direction === "left") {
      this.angle = this.angle + (Math.PI / 16);
    } else if (direction === "right") {
      this.angle = this.angle - (Math.PI / 16);
    }
    this.setPoint(this.angle);
  };

  Ship.prototype.setPoint = function(radian) {
    var x = this.radius * Math.sin(radian);
    var y = this.radius * Math.cos(radian);
    this.point = [this.pos[0] + x, this.pos[1] + y];
  }

  Ship.prototype.relocate = function() {
    this.velocity = Util.randomVec(0);
    this.pos = this.game.randomPosition()["pos"];
    this.angle = Math.PI;
    this.setPoint(this.angle);
  };

  Ship.prototype.draw = function(ctx) {
    ctx.fillStyle = this.color;
    ctx.beginPath();

    //void ctx.arc(x, y, radius, startAngle, endAngle, anticlockwise);
    ctx.arc(
      this.pos[0],
      this.pos[1],
      this.radius,
      0,
      2 * Math.PI,
      false
    );

    ctx.fill();

    ctx.fillStyle = "lightpink";
    ctx.beginPath();

    //void ctx.arc(x, y, radius, startAngle, endAngle, anticlockwise);
    ctx.arc(
      this.point[0],
      this.point[1],
      5,
      0,
      2 * Math.PI,
      false
    );

    ctx.fill();
  }

  Ship.prototype.power = function(impulse) {
    var direction = [(this.point[0] - this.pos[0]) / this.radius, 
                     (this.point[1] - this.pos[1]) / this.radius];

    this.vel = [this.vel[0] + direction[0], 
                this.vel[1] + direction[1]] ;
  };

  Ship.prototype.fireBullet = function () {
    var direction = [(this.point[0] - this.pos[0]) / this.radius * 8, 
                     (this.point[1] - this.pos[1]) / this.radius * 8]

    var bullet = new Bullet(this.pos, direction, this.game);
    this.game.bullets.push(bullet);
  };

}) (this);
