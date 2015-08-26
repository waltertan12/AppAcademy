require 'byebug'
require './Tile.rb'

class Board

  def Board.empty_grid
    Array.new(9) do
      Array.new(9) { Tile.new(0) }
    end
  end

  attr_reader :grid

  def initialize(grid = nil)
    @grid ||= Board.empty_grid
  end

  def Board.from_file(filename)
    rows = File.readlines(filename).map(&:chomp)
    tiles = rows.map do |row|
      nums = row.split("") { |char| Integer(char) }
      nums.map { |num| Tile.new(num) }
    end

    self.new(tiles)
  end

  # Use bracket methods
  def [](pos)
    x,y = pos
    grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    tile = grid[x][y]
    tile.value = value
  end

  def position
b
  end

  def render
    puts "  #{(0...9).to_a.join(" ")}"
    grid.each_with_index do |row, idx|
      puts "#{idx} #{row.join(" ")}"
    end
    nil
  end

  def solved_set?(tiles)
    nums = tiles.map(&:value)
    (1..9).to_a == nums.sort
  end

  def solved?
    rows.all?       { |row| solved_set?(row) } &&
      columns.all?  { |col| solved_set?(col) } &&
      squares.all?  { |squ| solved_set?(squ) }
  end

  def rows
    grid
  end

  def columns
    rows.transpose
  end

  def square(idx)
    tiles = []
    # View the board as a 9 sub-squares

    # 00 03 06        0 1 2
    # 30 33 36   OR   3 4 5
    # 60 63 66        6 7 8

    # x and y will return a sub-square given idx (a row/col number)

    x = (idx / 3) * 3
    y = (idx % 3) * 3

    # Find the tiles in each sub-square and add to the tiles array
    (x...x + 3).each do |i|
      (y...y + 3).each do |j|
        tiles << self[i, j]
      end
    end

    tiles
  end

  def squares
    (0..8).to_a.map { |i| square(i) }
  end

  def size
    grid.length
  end

end
