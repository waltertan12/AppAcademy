require_relative 'Queen'
require_relative 'Board'

class Solver
  attr_reader   :queens,    :board
  attr_accessor :solutions, :sol_count

  def initialize(queens = 8)
    @solutions = 0
    @sol_count = 0
    @board     = Board.new(queens)
    @queens    = queens
  end

  def place_queens
    solutions_array      = []
    locations            = []

    row_start, col_start = 0, 0
    queens_placed        = 0

    until (row_start >= queens && col_start >= queens - 1) #|| sol_count == solutions
      (row_start...queens).each do |row|
        if row != row_start
          col_start = 0
        end
        (col_start...queens).each do |col|
          # puts "hi"
          system("clear")
          place_queen(row, col)
          render_highlight([row, col])
          sleep(0.01)
          if board.conflict?
            remove_queen(row, col)
          else
            locations << [row, col] unless locations.include?([row, col])
            if locations.length == queens
              solutions_array << locations.sort unless solutions_array.include?(locations.sort)
              self.sol_count += 1
              puts "ITERATIVE solution #{sol_count}: "
              render
              print "\n"
            end
          end
        end
      end

      if locations.empty?
        col_start += 1
        if col_start >= queens
          row_start += 1
          col_start  = 0
        end
      else
        x, y = locations.pop
        remove_queen(x, y)
        if y >= queens - 1
          x += 1
          y  = 0
        else
          y += 1
        end
        row_start = x
        col_start = y
      end
    end

    solutions_array
  end

  def render_locations(array)
    array.each {|el| p el }
    array
  end

  def remove_queens(locations)
    locations.each do |location|
      remove_queen(*location)
    end
  end

  # Recursive depth first search
  def solve(row)
    (0...queens).each do |col|
      place_queen(row, col)

      unless board.conflict?
        if row == (queens - 1)
          self.solutions += 1
          puts "RECURSIVE solution #{solutions}: \n"
          render
          puts "\n"
        else
          solve(row + 1)
        end
      end
      remove_queen(row, col)
    end
  end

  def place_queen(row, col)
    board[row, col] = Queen.new("Q")
  end

  def remove_queen(row, col)
    board[row, col] = nil
  end

  def render_highlight(coords)
    board.render_highlight(coords)
  end

  def render
    board.render
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Select a size for the board / number of queens to place: "
  print "> "
  queens = gets.chomp.to_i
  s = Solver.new(queens)
  s.solve(0)
  s.place_queens
end