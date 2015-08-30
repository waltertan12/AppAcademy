require './Board'
require './Tile'

class Sudoku
  attr_accessor :board

  def initialize
    @board = nil
  end

  def play
    system("clear")
    puts "Welcome to Sudoku!"
    load
    play_turn until solved?
    board.render
    puts "You win... Or do you?"
  end

  def solved?
    board.solved?
  end

  def load
    puts "Would you like to load a particular board to play? [Y/N]"
    print "> "
    response = gets.chomp.downcase

    until response == 'y' || response == 'n'
      puts "Please type 'Y' or 'N'"
      response = gets.chomp.downcase
    end
    if response == 'y'
      puts "Please type in the filename of the board you would like to load: "
      print "> "
      filename = gets.chomp
      until File.file?(filename)
        puts "Please type in a valid filename"
        print "> "
        filename = gets.chomp
      end

      b = Board.from_file(filename)
    else
      filename = ["sudoku-1.txt","sudoku-2.txt","sudoku-3.txt","sudoku-1-almost.txt", "sudoku-1-solved.txt"].sample
      b = Board.from_file("Sudoku-Boards/"+filename)
    end

    self.board = b
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
    system("clear")
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
  # puts "Would you like to load a particular board to play? [Y/N]"
  # print "> "
  # response = gets.chomp.downcase

  # until response == 'y' || response == 'n'
  #   puts "Please type 'Y' or 'N'"
  #   response = gets.chomp.downcase
  # end

  # if response == 'y'
  #   puts "Please type in the filename of the board you would like to load: "
  #   print "> "
  #   filename = gets.chomp
  #   until File.file?(filename)
  #     puts "Please type in a valid filename"
  #     print "> "
  #     filename = gets.chomp
  #   end

  #   b = Board.from_file(filename)
  # else
  #   b = Board.new
  # end

  Sudoku.new().play
end