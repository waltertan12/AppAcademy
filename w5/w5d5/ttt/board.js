var Board = function() {
  this.grid = [[null, null, null],[null, null, null],[null, null, null]];
  this.winner = null;
};

Board.prototype.won = function() {
  var toCheck = [].concat(this.grid, this.grid.transpose(), this.diagonals());
  return this.check(toCheck);
};


Board.prototype.empty = function(pos) {
  var row = pos[0];
  var col = pos[1];
  return this.grid[row][col] ===  null;
};

Board.prototype.print = function() {
  this.grid.forEach(function(row) {
    console.log(JSON.stringify(row));
  });
};

Board.prototype.placeMark = function(pos, mark) {
  if (this.empty(pos)) {
    var row = pos[0];
    var col = pos[1];
    this.grid[row][col] = mark;
    return true;
  }
  return false;
};

Board.prototype.diagonals = function() {
  var diagonalOne = [
    this.grid[0][0],
    this.grid[1][1],
    this.grid[2][2]
  ];

  var diagonalTwo = [
    this.grid[0][2],
    this.grid[1][1],
    this.grid[2][0]
  ];

  return [diagonalOne, diagonalTwo];
};

Board.prototype.check = function(grid) {
  // console.log(grid);
  var that = this;
  var result = false;
  grid.forEach(function(row) {
    if ( row.equal(["x" ,"x", "x"]) || row.equal(["o", "o", "o"]) ) {
      that.winner = row[0];
      result = true;
    }
  });
  return result;
};

Array.prototype.equal = function (otherArray) {
  return JSON.stringify(this) === JSON.stringify(otherArray);
};

Array.prototype.transpose = function() {
  var length = this.length;
  var width  = this[0].length;
  var result = [];

  for (var i = 0; i < width; i++) {
    var temp = [];
    for(var j = 0; j < length; j++) {
      temp.push(null);
    }
    result.push(temp);
  }

  for (var row = 0; row < length; row++) {
    for (var col = 0; col < width; col++) {
      result[col][row] = this[row][col];
    }
  }

  return result;
};

module.exports = Board;
