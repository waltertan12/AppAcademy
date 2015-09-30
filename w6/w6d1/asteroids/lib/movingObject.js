(function(root) {
  if (typeof Asteroids === "undefined") {
    root.Asteroids = {};
  }

  var Util = root.Asteroids.Util;

  var MovingObject = root.Asteroids.MovingObject = function (args, game) {
    this.pos = args["pos"];
    this.vel = args["vel"];
    this.radius = args["radius"];
    this.color = args["color"];
    this.isWrappable = true;

    this.game = game;
  };

  MovingObject.prototype.draw = function(ctx) {
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
  };

  MovingObject.prototype.move = function () {
    this.pos[0] += this.vel[0];
    this.pos[1] += this.vel[1];

    if (this.isWrappable) {
      this.pos = this.game.wrap(this.pos);
    }
  };

  MovingObject.prototype.isCollideWith = function (otherObject) {
    var dist = Util.distance(this.pos, otherObject.pos);

    if (dist < (this.radius + otherObject.radius)) {
      return true;
    } else {
      return false;
    }
  };

  MovingObject.prototype.collideWith = function(otherObject) {
    // if (this.isCollideWith(otherObject)) {
    //   this.game.remove(this);
    //   this.game.remove(otherObject);
    // }
  };
}) (this);
