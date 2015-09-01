require_relative 'board'
require 'colorize'
require_relative 'cursorable'

class Display
attr_accessor :cursor, :selected
include Cursorable

  def initialize(board)
      @board = board
      @cursor_pos = [0, 0]
      @selected = false
  end

  def build_grid
    @board.grid.map.with_index do |row, i|
      build_row(row, i)
    end
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
      bg = :light_red
    elsif (i + j).odd?
      bg = :green
    else
      bg = :blue
    end
    { background: bg, color: piece_color }
  end

  def render
    system("clear")
    puts "Fill the grid!"
    puts "Arrow keys, WASD, or vim to move, space or enter to confirm."
    build_grid.each { |row| puts row.join }
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
