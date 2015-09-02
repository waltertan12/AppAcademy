require_relative 'board'
require_relative 'cursorable'
require_relative 'piece_manifest'
require 'colorize'

class Display
  attr_accessor :selected_piece_moves, :color_to_highlight
  include Cursorable

  def initialize(board)
    @board = board
    @cursor_pos = [0, 0]
    @selected_piece_moves = []
    @selected_pos = []
    @color_to_highlight = :white
  end

  def build_grid
    grid_display = @board.grid.map.with_index do |row, i|
      build_row(row, i)
    end
    if @selected_piece_moves.empty?
      highlight_cursor(grid_display)
    else
      grid_display
    end
  end

  def change_color
    if color_to_highlight == :white
      self.color_to_highlight = :black
    else
      self.color_to_highlight = :white
    end
  end

  def highlight_cursor(grid_display)
    current_piece = @board[*@cursor_pos]
    if current_piece.occupied? && current_piece.color == color_to_highlight
      to_highlight = current_piece.legal_moves
      to_highlight.each do |pos|
        x, y = pos
        opposing_piece = @board[x, y]
        if opposing_piece.occupied? && current_piece.color != opposing_piece.color
          grid_display[x][y] = grid_display[x][y].colorize({background: :red})
        else
          grid_display[x][y] = grid_display[x][y].colorize({background: :light_magenta})
        end
      end
    end
    grid_display
  end

  def moves_to_highlight(piece)
    @selected_piece_moves = piece.legal_moves
    @selected_pos = piece.position
    puts "Moves to hightlight: #{@selected_pos} or #{piece.position}"
  end

  def unhighlight
    @selected_piece_moves = []
    @selected_pos = []
  end

  def build_row(row, i)
    row.map.with_index do |piece, j|
      color_options = colors_for(i, j)
      piece.to_s.colorize(color_options)
    end
  end

  def colors_for(i, j)
    piece_color = @board[i, j].color
    if [i, j] == @cursor_pos
      bg = :light_black
    elsif @selected_piece_moves.include?([i, j])
      bg = :yellow
    elsif @selected_pos == [i, j]
      bg = :magenta
    elsif (i + j).odd?
      bg = :light_green
    else
      bg = :green
    end
    { background: bg, color: piece_color }
  end

  def render
    system("clear")
    puts "N C\na h\nr e\nr s\no s\nw \n!!"
    puts "The most narrow chess you will ever play."
    puts "Rules: Play until you win."
    puts "Arrow keys to move, space or enter to confirm."
    build_grid.each_with_index { |row, idx| puts (8-idx).to_s + row.join }
    puts " ABCDEFGH"
  end

end

if __FILE__ == $PROGRAM_NAME
  b = Board.new
  d = Display.new(b)
  while true
    d.render
    d.get_input
  end
end