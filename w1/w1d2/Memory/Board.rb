require_relative 'Card'

class Board
  attr_accessor :grid
  BOARD_SIZE = 4

  def initialize
    @grid = Array.new(BOARD_SIZE) { Array.new(BOARD_SIZE) }
    self.populate
  end

  def populate
    card_array = []
    until card_array.length == (BOARD_SIZE ** 2)
      temp_card = Card.new
      unless card_array.include?(temp_card)
        card_array << temp_card.dup
        card_array << temp_card
      end
    end

    card_array.shuffle!

    (0...BOARD_SIZE).each do |idx1|
      (0...BOARD_SIZE).each do |idx2|
        self.grid[idx1][idx2] = card_array.pop
      end
    end
  end

  def render
    puts "  0     1     2     3     "
    (0...BOARD_SIZE).each do |idx1|
      print "#{idx1} "
      (0...BOARD_SIZE).each do |idx2|
        print "#{grid[idx1][idx2]}"
      end
        print "\n"
    end
  end

  def reveal(guessed_pos)
    self[*guessed_pos].reveal
    # self[*guessed_pos].value
  end

  def won?
    grid.each do |sub_arr|
      return false if sub_arr.any? { |el| el.state == false }
    end
    true
  end

  def [](row, col)
    grid[row][col]
  end

end
