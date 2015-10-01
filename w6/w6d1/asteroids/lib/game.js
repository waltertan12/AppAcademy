(function(root) {
  if (typeof Asteroids === "undefined") {
    root.Asteroids = {};
  }

  var Asteroid = root.Asteroids.Asteroid;
  var Util = root.Asteroids.Util;
  var Ship = root.Asteroids.Ship;

  var Game = root.Asteroids.Game = function() {
    var game = this;
    this.asteroids = [];
    this.bullets = [];
    this.addAsteroids();
    this.ship = new Ship(this.randomPosition(), this);
    this.image = new Image();
    this.image.src = 'space.jpg';
  };

  Game.DIM_X = root.innerHeight;
  Game.DIM_Y = root.innerWidth;
  Game.NUM_ASTEROIDS = 10;

  Game.prototype.randomPosition = function() {
    return { pos:
      [Math.random() * Game.DIM_X, Math.random() * Game.DIM_Y]
    };
  };

  Game.prototype.addAsteroids = function() {
    var i, newAsteroid, game = this;
    for(i = 0; i < Game.NUM_ASTEROIDS; i++) {
      newAsteroid = new Asteroid(this.randomPosition(), game);
      this.asteroids.push(newAsteroid);
    }
  };

  Game.prototype.draw = function(ctx) {
    ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y);
    // ctx.drawImage(this.image, 0, 0);

    this.allObjects().forEach(function (object) {
      object.draw(ctx);
    });
  };

  Game.prototype.moveObjects = function() {
    this.allObjects().forEach(function (object) {
      object.move();
    });
  };

  Game.prototype.wrap = function(pos) {
    var newPos = [pos[0], pos[1]];

    if (pos[0] > Game.DIM_X) {
      newPos[0] = pos[0] % Game.DIM_X;
    } else if (pos[0] < 0) {
      newPos[0] = pos[0] + Game.DIM_X;
    }

    if (pos[1] > Game.DIM_Y) {
      newPos[1] = pos[1] % Game.DIM_Y;
    } else if (pos[1] < 0) {
      newPos[1] = pos[1] + Game.DIM_Y;
    }

    return newPos;
  };

  Game.prototype.checkCollisions = function () {
    var game = this;
    this.allObjects().forEach(function (object) {
      game.allObjects().forEach(function (target) {
        if (object !== target) {
          if (object.isCollideWith(target)) {
            object.collideWith(target);
          }
        }
      });
    });
  };

  Game.prototype.step = function () {
    this.moveObjects();
    this.checkCollisions();
  };

  Game.prototype.remove = function(asteroid) {
    var index = this.asteroids.indexOf(asteroid);
    this.asteroids.splice(index, 1);
  };

  Game.prototype.allObjects = function() {
    return this.asteroids.concat(this.ship).concat(this.bullets);
  };

  Game.prototype.isOutOfBounds = function(pos) {
    var x = pos[0];
    var y = pos[1];
    return (x < 0 || x > Game.DIM_X) || (y < 0 || y > Game.DIM_Y);
  };

}) (this);
