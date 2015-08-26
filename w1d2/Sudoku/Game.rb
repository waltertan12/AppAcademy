require './Board'
require './Tile'

class Game
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def play
    play_turn until solved?
    board.render
    puts "You win... Or do you?"
  end

  def solved?
    board.solved?
  end

  def prompt
    pos = nil
    until pos && valid_pos?(pos)
      puts "Please enter a position in the form #,# "
      print ">"
      pos = parse_pos(gets.chomp)
    end
    val = nil
    until val && valid_val?(val)
      puts "Please enter a value between 1 and 9 (0 to clear the tile)"
      print ">"
      val = Integer(gets.chomp)
    end
    {"position" => pos, "value" => val}
  end

  def play_turn
    board.render
    play_hash = prompt
    pos = play_hash["position"]
    val = play_hash["value"]
    board[pos] = val
  end

  def parse_pos(string)
    string.split(",").map { |char| Integer(char) }
  end

  def valid_pos?(pos)
    pos.is_a?(Array)  &&
      pos.length == 2 &&
      pos.all? { |x| x.between?(0, board.size - 1) }
  end

  def valid_val?(val)
    val.is_a?(Integer) &&
      val.between?(0, 9)
  end
end

if __FILE__ == $PROGRAM_NAME
  b = Board.new
  g = Game.new(b)
  g.play
end
