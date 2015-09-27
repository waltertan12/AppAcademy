Function.prototype.myBind = function (context) {
  var fn = this;
  var args = [];

  for (var property in arguments){
    if (arguments.hasOwnProperty( property ) && property !== '0'){
      args.push(arguments[property]);
    }
  }

  return function () {
    var args2 = [];

    for (var property in arguments){
      if (arguments.hasOwnProperty( property )){
        args2.push(arguments[property]);
      }
    }

    args = args.concat(args2);
    console.log(args);
    fn.apply(context, args);
  };
};


var Cat = function() {
  this.color = "Purple";
  this.weight = 9000;
};

Cat.prototype.makeFatter = function() {
  for (var property in arguments){
    if (arguments.hasOwnProperty( property )){
      this.weight = this.weight + arguments[property];
    }
  }
};

var cat = new Cat();
console.log(cat);
cat.makeFatter(3000);
console.log(cat);

var f = cat.makeFatter.myBind(cat, 100);
f(1000, 999, 9998, 23432);
console.log(cat);
