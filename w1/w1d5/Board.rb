require_relative 'Tile'

class Board

  def initialize(num_of_bombs = 5)
    @board = Board.empty_grid
    @bombs = []
    @flags = []

    generate_bombs(num_of_bombs)
    populate_board
  end

  def generate_bombs(num)
    until bombs.length == num
      potential_bomb = [rand(9), rand(9)]
      bombs << potential_bomb unless bombs.include?(potential_bomb)
    end
  end

  def populate_board
    board.each_index do |row|
      board.each_index do |col|
        if bombs.include? [row, col]
          board[row][col] = Tile.new(true, self,  [row, col])
        else
          board[row][col] = Tile.new(false, self, [row, col])
        end
      end
    end
  end

  def render
    puts "  0 1 2 3 4 5 6 7 8"
    board.each_with_index do |row_arr, row_idx|
      render_row(row_arr, row_idx)
    end
    nil
  end

  def render_row(array, index)
    print "#{index} "
    array.each do |elem|
      print "#{elem} "
    end
    print "\n"
  end

  def over?
    won? || lost?
  end

  def won?
    flags.sort == bombs.sort
  end

  def lost?
    board.flatten.any? { |tile| tile.revealed? && tile.bombed? }
  end

  def self.empty_grid
    Array.new(9) { Array.new(9) }
  end

  def [](pos)
    row, col = pos
    board[row][col]
  end

  def []=(pos, val)
    row, col = pos
    self.board[row][col] = val
  end

  def reveal(pos)
    queue = [ self[pos] ]

    until queue.empty?
      current_tile = queue.shift
      value = current_tile.reveal

      if value == 0
        current_tile.neighbors.each do |neighbor_tile|
          queue << neighbor_tile unless neighbor_tile.revealed?
        end
      end
    end
  end

  def flag(pos)
    self[pos].flag
  end

  def unflag(pos)
    self[pos].unflag
  end

  def inspect
    "<Board##{object_id}>, Bombs: #{bombs}, Flags: #{flags}"
  end

  private
    attr_reader   :bombs, :flags
    attr_accessor :board
end