var Board = require("./board");
var readline = require("readline");

var reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

var Game = function(board){
  this.board = board || new Board();
};

Game.prototype.play = function(completionCallback) {
  this.board.print();
  var that = this;

  this.promptMove(function(row, col, mark) {
    var placedMark = that.board.placeMark([row, col], mark);
    if (!placedMark) {
      console.log("no");
    }

    if (that.board.won()) {
      reader.close();
      completionCallback();
    }
    else {
      that.play(completionCallback);
    }
  });
};

Game.prototype.promptMove = function (callback) {
  reader.question("Select a row", function(row){
    reader.question("Select a col", function(col){
      reader.question("Select a mark", function(mark){
        var x = parseInt(row);
        var y = parseInt(col);

        callback(x, y, mark);
      });
    });
  });
};

module.exports = Game;
