require_relative 'board'
require_relative 'display'
require_relative 'error'

class Game
  attr_accessor :selected

  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @players = [:white, :black]
    @selected = false
  end

  def play
    welcome_message
    until over?
      play_turn
    end
    game_over_message
  end

  def over?
    @board.checkmate?(:white) || @board.checkmate?(:black)
  end

  def welcome_message
    puts "Welcome to Narrow Chess!!!!!!!"
  end

  def game_over_message
    @display.render
    puts "No more narrow chess..."
  end

  # def make_move
  #   coords = get_input
  #   if !@selected.empty
  #     move_piece(@board[*@selected], coords)
  #     @selected = []
  #   elsif !coords.nil?
  #     selected_piece = @board[*coords]
  #     @selected = coords
  #     @display.moves_to_highlight(selected_piece)
  #   end
  # end
  #
  # def move_piece(piece, end_pos)
  #   @board.move(piece, end_pos)

  def make_move
    # piece = select_piece
    # move_piece(piece)
    puts "Select a piece"
    selection = get_input
    if selection && valid_selection?(selection)
      selected_piece = @board[*selection]
      @display.moves_to_highlight(selected_piece)
      puts "Move the piece"
      begin
        puts "You selected a #{selected_piece}"
        end_pos = get_input
        until valid_pos(end_pos)
          # puts "You selected a #{selected_piece}"
          end_pos = get_input
          @display.render
        end

        if end_pos != selection
          @board.move(selected_piece, end_pos)
          @players.rotate!
        else
          puts "Select a piece"
        end
        @display.un_highlight
      rescue MoveError
        puts "Invalid selection"
        retry
      end
    end
  end

  # def select_piece
  #   puts "select a piece"
  #   selection = get_input
  #   if selection && valid_selection?(selection)
  #     @display.moves_to_highlight(selected_piece)
  #     puts "You selected a '#{selected_piece.to_s}'"
  #     selected_piece = @board[*selection]
  #   end
  # end
  #
  # def move_piece(piece)
  #   puts "Move the piece"
  #   begin
  #     end_pos = get_input
  #     until valid_pos(end_pos)
  #       end_pos = get_input
  #       @display.render
  #     end
  #
  #     if end_pos != piece.position
  #       @board.move(piece, end_pos)
  #       @players.rotate!
  #     # else
  #     #   puts "Select a piece"
  #     end
  #     @display.un_highlight
  #   rescue MoveError
  #     puts "Invalid selection"
  #     retry
  #   end
  # end


  def valid_selection?(coords)
    # return false if coords.nil?
    @board[*coords].color == @players.first
  end

  def play_turn
    render
    puts "#{@players.first} turn"
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
