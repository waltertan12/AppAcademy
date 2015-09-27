var readline = require("readline");

var reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

var HanoiGame = function() {
  this.stacks = [[1], [3,2], []];
};

HanoiGame.prototype.isWon = function() {
  var winningStack = [3, 2, 1];
  return (this.stacks[2].equal(winningStack) || this.stacks[1].equal(winningStack));
};


HanoiGame.prototype.isValidMove = function(startTower, endTower) {
  console.log(this.stacks[startTower].last());
  console.log(this.stacks[endTower].last());
  return this.stacks[startTower].last() < this.stacks[endTower].last();
};

HanoiGame.prototype.move = function(startTower, endTower){
  if (this.isValidMove(startTower, endTower)){
    this.stacks[endTower].push(this.stacks[startTower].pop());
    return true;
  }
  return false;
};

HanoiGame.prototype.print = function () {
  console.log(JSON.stringify(this.stacks));
};

HanoiGame.prototype.promptMove = function (callback) {
  reader.question("Select starting stack", function(startIdx){
    reader.question("Select ending stack", function(endIdx){
      var start = parseInt(startIdx);
      var end = parseInt(endIdx);

      callback(start, end);
    });
  });
};

HanoiGame.prototype.run = function (completionCallback){
  this.print();

  var that = this;
  this.promptMove( function (start, end){
    var moved = that.move(start, end);
    if (!moved) {
      console.log("illegal move");
    }

  if(that.isWon()){
    completionCallback();
  }else {
    that.run(completionCallback);
  }

  });
};

Array.prototype.last = function(){
  if (this.length === 0){
    return 4;
  }
  return this[this.length - 1];
};

Array.prototype.equal = function (otherArray) {
    return JSON.stringify(this) === JSON.stringify(otherArray);
};

var game = new HanoiGame();
game.run(function(){
  console.log("Game Over");
  reader.close();
});
