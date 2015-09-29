Function.prototype.inherits = function(parent) {
  var Surrogate = function() {};
  Surrogate.prototype = parent.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
};

function MovingObject () {}
MovingObject.prototype.move = function() {
  console.log("moving");
};

function Ship () {

}
Ship.inherits(MovingObject);

function Asteroid () {
  this.asdf = function() {
    console.log("Asdf");
  };
}
Asteroid.inherits(MovingObject);

var ship = new Ship();
var asteroid = new Asteroid();
ship.move();
asteroid.move();
asteroid.asdf();
