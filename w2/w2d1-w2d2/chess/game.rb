#!/usr/bin/env ruby
require_relative 'board'
require_relative 'display'
require_relative 'error'
require_relative 'player'

class Game
  def initialize
    @board = Board.new
    # @board = Board.stalemate_board
    @display = Display.new(@board)
    @selected_piece = nil
    @selected_pos = []
    @players = initialize_players
    @current_player = @players.first
  end

  def play
    welcome_message
    until over?
      play_turn
    end
    game_over_message
  end

  private

  attr_accessor :selected_pos, :selected_piece, :selected_pos, :players, :current_player
  attr_reader   :display, :board

  def initialize_players
    puts "1: Human vs Human"
    puts "2: Human vs Computer"
    print "> "
    setting = nil
    until !setting.nil? && setting < 3 && setting > 0
      setting = gets.chomp.to_i
    end
    case setting
      when 1
        players = [HumanPlayer.new(:white, board), HumanPlayer.new(:black, board)] 
      when 2
        players = [HumanPlayer.new(:white, board), ComputerPlayer.new(:black, board)] 
    end
    players
  end

  def over?
    @board.checkmate?(:white) || @board.checkmate?(:black) || 
    @board.stalemate?(:white) || @board.stalemate?(:black)
  end

  def welcome_message
    system("clear")
    puts "Welcome to Narrow Chess!!!!!!!"
    puts "e\nl\nc\no\nm\ne\n \nt\no\n \nN\na\nr\nr\no\nw\n \nC\nh\ne\ns\ns"
    sleep (2)
  end

  def game_over_message
    display.render
    if @board.stalemate?(:white) || @board.stalemate?(:black)
      puts "Stalemate..."
    else
      puts "Checkmate..."
    end
    puts "No more narrow chess..."
  end

  def make_move
    # self.current_player = players.first
    coords = current_player.get_input(display)
    puts "COLOR: #{current_player.color}, COORDS: #{coords}, SELECTED: #{selected_piece}, TILE COLOR: #{board[*coords].color if !coords.nil?}"
    if moving_piece?(coords)
      if coords == selected_pos
        clear_selection
      else
        begin
          puts "MOVE THE PIECE"
          move_piece(selected_piece, coords)
          display.change_color
          players.rotate!
          self.current_player = players.first
        rescue MoveError
          puts "Invalid move"
          clear_selection
        end
      end
      display.unhighlight
    elsif selecting_piece?(coords)
      puts "SELECTING PIECE"
      make_selection(coords)
    end
  end

  def clear_selection
    self.selected_pos = []
    self.selected_piece = nil
  end

  def selecting_piece?(coords)
    !coords.nil? && board[*coords].color == current_player.color
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
    puts "#{current_player.color.to_s.capitalize} turn"
    make_move
    board.promote_pawns
  end

  def valid_pos(input)
    !input.nil?
  end

  def render
    @display.render
  end

  # def get_input
  #   @display.get_input
  # end
end

if __FILE__ == $PROGRAM_NAME
  Game.new.play
end
