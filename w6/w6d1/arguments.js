function sum () {
  var args = Array.prototype.slice.call(arguments);
  var total = 0;
  args.forEach(function (i) { total += i; });

  return total;
}

Function.prototype.myBind = function(context) {
  var args = Array.prototype.slice.call(arguments);
  var fn = this;

  return function() {
    var innerArgs = Array.prototype.slice.call(arguments);
    fn.apply(context, args.slice(1).concat(innerArgs));
    // fn.apply(context, innerArgs.concat(args.slice(1)));
  };
};

function Cat(name) {
  this.name = name;
}



Cat.prototype.says = function (sound) {
  console.log(this.name + " says " + sound + "!");
};

var markov = new Cat("Markov"),
    breakfast = new Cat("Breakfast");

markov.says("meow");
// Markov says meow!

markov.says.myBind(breakfast, "meow")();
// Breakfast says meow!

markov.says.myBind(breakfast)("meow");
// Breakfast says meow!

var notMarkovSays = markov.says.myBind(breakfast);
notMarkovSays("meow");
// Breakfast says meow!

function curriedSum(numArgs) {
  var numbers = [];

  var _curriedSum = function() {
    numbers.push(arguments[0]);

    if (numbers.length === numArgs) {
      var sum = 0;
      for (var i = 0; i < numbers.length; i++) {
        sum += numbers[i];
      }

      return sum;
    } else {
      return _curriedSum;
    }
  };

  return _curriedSum;
}

var sum = curriedSum(4);
var a = sum(5)(30)(20)(1);

console.log(a);

Function.prototype.curry = function (numArgs) {
  var fn = this;
  var argsArray = [];

  var _curry = function() {
    argsArray.push(arguments[0]);
    console.log(argsArray);
    if (argsArray.length < numArgs) {
      return _curry;
    } else {
      console.log(fn);
      return fn.apply(null, argsArray);
    }
  };
  return _curry;
};

function totalSum() {
  var args = Array.prototype.slice.call(arguments);
  var sum = 0;
  for (var i = 0; i < args.length; i++) {
    sum += args[i];
  }
  return sum;
}

var a = totalSum.curry(5)(1)(3)(3)(5)(9);
console.log(a);
