class Board

  def initialize(num_of_bombs = 5)
    @board = Board.empty_grid
    @bombs = generate_bombs(num_of_bombs)
    @flags = []

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

  def over?
    won? || lost?
  end

  def won?
    flags.sort == bombs.sort
  end

  def lost?
    board.flatten.any? { |tile| tile.bombed? }
  end

  def self.empty_grid
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
    attr_reader   :bombs, :flags
    attr_accessor :board
end