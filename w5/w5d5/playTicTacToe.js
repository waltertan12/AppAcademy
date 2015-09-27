var TicTacToe = require("./ttt/index");

// var Board = TicTacToe.Board();
// var Game = TicTacToe.Game();

var game = new TicTacToe.Game();
game.play(function() {
  console.log(":) " + game.board.winner);
});
