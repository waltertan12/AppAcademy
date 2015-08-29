require 'yaml'
require_relative 'Board'

class Minesweeper
  attr_accessor :moves, :flags

  def initialize(num_of_bombs = 5)
    @name  = nil
    @moves = 0
    @flags = 0
    @bombs = num_of_bombs
    @board = Board.new(num_of_bombs)
  end

  def play
    if name.nil?
      welcome
      load
    end

    until board.over?
      play_turn
    end

    game_over_response
  end

  def play_turn
    update
    coordinate, decision = get_response
    case decision
      when 'f'
        board.flag(coordinate)
        self.flags += 1
      when 'u'
        board.unflag(coordinate)
        self.flags -= 1
      when 'r'
        board.reveal(coordinate)
    end
    self.moves += 1
  end

  def game_over_response
    system("clear")
    board.render
    if board.won?
      Kernel.abort("Yey")
    else
      Kernel.abort("Oh no...")
    end
  end

  def welcome
    system("clear")
    puts "Welcome to Minesweeper"
    get_name
    puts "#{name}, type 'exit' at any point in the game to save and exit."
  end

  def update
    system("clear")
    board.render
    puts "Moves Taken: #{moves}, Mines Remaining: #{bombs - flags}"
  end

  def load
    puts "Would you like to load a saved game? [Y/N]"
    print "> "
    response = gets.chomp.downcase
    until (/^y$|^n$|^yes$|^no$/).match(response)
      response = gets.chomp.downcase
      puts "Please type 'Y' or 'N'"
      print "> "
    end

    load_file if (/y/).match(response)
  end

  def load_file
    puts "Type the name of the file you'd like to load:"
    print "> "
    filename = ""
    until valid_file?(filename)
      filename = gets.chomp
    end
    YAML.load_file(filename).play
  end

  def valid_file?(filename)
    File.file?(filename)
  end

  def get_name
    if name.nil?
      puts "What is your name"
      print "> "
      self.name = gets.chomp
    end
  end

  def get_response
    [get_coordinate, get_decision]
  end

  def get_coordinate
    puts "Please select coordinates (enter row,col)"
    print "> "
    coordinate = nil
    until valid_coordinate?(coordinate)
      coordinate = gets.chomp
      save if coordinate == "save"
      coordinate = coordinate.gsub(" ","").split(",").map!(&:to_i)
      puts "Please enter a valid coordinate" unless valid_coordinate?(coordinate)
    end
    coordinate
  end

  def get_decision
    puts "What would you like to do (enter 'f' to flag, 'u' to unflag, 'r' to reveal"
    print "> "
    decision = nil
    until valid_decision?(decision)
      decision = gets.chomp
      save if decision == "save"
      puts "Please type f, r, or u to flag, reveal, or unflag" unless valid_decision?(decision)
    end
    decision
  end

  def valid_coordinate?(coordinate)
    coordinate.is_a?(Array) && coordinate.length == 2 &&
    coordinate.first < 9    && coordinate.first  >= 0 &&
    coordinate.last  < 9    && coordinate.last   >= 0
  end

  def valid_decision?(decision)
    !(/^f$|^u$|^r$/).match(decision).nil?
  end

  def save
    puts "Name the file:"
    print "> "
    filename = gets.chomp
    File.write(filename, self.to_yaml)
    Kernel.abort("Goodbye")
  end

  private
    attr_accessor :name
    attr_reader   :board, :bombs
end

if __FILE__ == $PROGRAM_NAME
  Minesweeper.new.play
end