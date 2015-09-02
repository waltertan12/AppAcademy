require_relative 'board'
require_relative 'display'
require_relative 'error'

class Game
  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @players = [:white, :black]
    @selected_piece = nil
    @selected_pos = []
  end

  def play
    welcome_message
    until over?
      play_turn
    end
    game_over_message
  end

  private
  attr_accessor :selected_pos, :selected_piece, :selected_pos, :players
  attr_reader   :display, :board

  def over?
    @board.checkmate?(:white) || @board.checkmate?(:black)
  end

  def welcome_message
    system("clear")
    puts "Welcome to Narrow Chess!!!!!!!"
    puts "e\nl\nc\no\nm\ne\n \nt\no\n \nN\na\nr\nr\no\nw\n \nC\nh\ne\ns\ns"
    sleep (2)
  end

  def game_over_message
    display.render
    puts "No more narrow chess..."
  end

  def make_move
    coords = get_input
    if moving_piece?(coords)
      if coords == selected_pos
        clear_selection
      else
        begin
          move_piece(selected_piece, coords)
          display.change_color
          players.rotate!
        rescue MoveError
          puts "Invalid move"
          clear_selection
        end
      end
      display.unhighlight
    elsif selecting_piece?(coords)
      make_selection(coords)
    end
  end

  def clear_selection
    self.selected_pos = []
    self.selected_piece = nil
  end

  def selecting_piece?(coords)
    !coords.nil? && board[*coords].color == players.first
  end

  def moving_piece?(coords)
    !selected_piece.nil? && !coords.nil?
  end

  def make_selection(coords)
    pos   = coords
    self.selected_piece = @board[*coords]
    display.moves_to_highlight(selected_piece)
  end
  
  def move_piece(piece, end_pos)
    board.move(piece, end_pos)
    self.selected_piece = nil
    self.selected_pos   = []
  end

  def play_turn
    render
    puts "#{@players.first.to_s.capitalize} turn"
    make_move
  end

  def valid_pos(input)
    !input.nil?
  end

  def render
    @display.render
  end

  def get_input
    @display.get_input
  end
end

if __FILE__ == $PROGRAM_NAME
  Game.new.play
end
