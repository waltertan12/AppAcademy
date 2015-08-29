class Board

  def initialize(num_of_bombs = 5)
    @board = Array.new(8) { Array.new(8) }
    @bombs = generate_bombs(num_of_bombs)

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

  def self.default_grid
    Array.new(8) { Array.new(8) }
  end

  def [](pos)
    row, col = pos
    board[row][col]
  end

  def []=(pos, val)
    row, col = pos
    self.board[row][col] = val
  end

  private
    attr_reader   :bombs
    attr_accessor :board
end