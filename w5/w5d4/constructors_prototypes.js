var Cat = function(name, owner) {
  this.name = name;
  this.owner = owner;
};

Cat.prototype.cuteStatement = function (){
  return this.owner + " loves " + this.name;
};

var cat = new Cat("bob", "bob2");
console.log(cat.cuteStatement());

cat.cuteStatement = function (){
  return "Everyone loves " + this.name;
};

console.log(cat.cuteStatement());

Cat.prototype.meow = function(){
  return "meowing";
};

console.log(cat.meow());

var cat2 = new Cat("ffff", "ssss");
cat2.meow = function(){
  return "woof";
};

console.log(cat.meow());
console.log(cat2.meow());
