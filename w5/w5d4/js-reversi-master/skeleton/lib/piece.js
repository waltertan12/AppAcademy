/**
 * Initializes the Piece with its color.
 */
function Piece (color) {
  var COLORS = ["b", "w"];
  if (COLORS.indexOf(color) > -1) {
    this.color = color;
  } else {
    console.log("Stop that.");
  }
}

/**
 * Returns the color opposite the current piece.
 */
Piece.prototype.oppColor = function () {
  if (this.color === "b"){
    return "w";
  } else {
    return "b";
  }
};

/**
 * Changes the piece's color to the opposite color.
 */
Piece.prototype.flip = function () {
  if (this.color === "b"){
    this.color = "w";
  } else {
    this.color = "b";
  }
};

/**
 * Returns a string representation of the string
 * based on its color.
 */
Piece.prototype.toString = function () {
  return this.color;
};

module.exports = Piece;
