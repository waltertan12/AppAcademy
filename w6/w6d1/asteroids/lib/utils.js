(function(root) {
  if (typeof Asteroids === "undefined") {
    root.Asteroids = {};
  }

  var Util = root.Asteroids.Util = {
    inherits: function(ChildClass, ParentClass) {
      var Surrogate = function() {};
      Surrogate.prototype = ParentClass.prototype;
      ChildClass.prototype = new Surrogate();
      ChildClass.prototype.constructor = ChildClass;
    },

    randomVec: function(length) {
      return [length * (Math.random() - 0.5), length * (Math.random() - 0.5)];
    },

    distance: function(obj1, obj2) {
      var x1 = obj1[0];
      var x2 = obj2[0];
      var y1 = obj1[1];
      var y2 = obj2[1];

      return Math.sqrt(((x1-x2)*(x1-x2)) + ((y1-y2)*(y1-y2)));
    },

    norm: function(obj1) {
      return Util.distance([0,0], obj1.pos);
    }
  };
}) (this);
