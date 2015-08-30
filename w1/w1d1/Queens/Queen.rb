require './Board'

class Queen
  attr_reader :symbol

  def initialize(symbol)
    @symbol = symbol 
  end

  def to_s
    symbol
  end

  def inspect
    symbol
  end
end

class Solver
  attr_reader   :queens, :board
  # attr_accessor :board
  def initialize(queens = 8)
    @board  = Board.new(queens)
    @queens = queens
  end

  # Breadth first search of 
  def place_queens
    system("clear")
    locations = []


    # Start at (0,0) and place queens
    row_start = 0
    col_start = 0

    row_start_two = 0
    col_start_two = 0

    until locations.length == queens

      (row_start...queens).each do |row|
        (col_start...queens).each do |col|
          # puts "#{row} #{col}"
          place_queen(row, col)

          if board.conflict?
            remove_queen(row, col)
          else
            locations << [row, col] unless locations.include?([row, col])
          end

          # render
          # sleep(0.005)
          # system("clear")
        end
      end

      # If no solution is found, change the initial starting position
      # and existing queens
      col_start += 1
      if col_start == queens
        row_start += 1
        col_start =  0
      end

      # Remove all queens if the original starting point didn't work
      if row_start == queens && locations.length < queens
        col_start_two += 1
        if col_start_two == queens
          row_start_two += 1
          col_start_two =  0
        end
        row_start = row_start_two
        col_start = col_start_two
        remove_queens(locations)
        locations = []
      # Remove all but the first queen to see 
      else
        remove_queens(locations.drop(queens - col_start))
        locations = locations.take(queens - col_start)
      end
    end

    if locations.length == queens - 1
    puts "Found successful solution!"
    puts "#{locations}"
    else
      puts "dang..."
    end
    render
  end

  def remove_queens(locations)
    locations.each do |location|
      remove_queen(*location)
    end
  end

  # Breadth first searching of a solution
  # Start at [0, 0] and place a queen, then view all 
  def solve(row)
    (0...queens).each do |col|
      place_queen(row, col)

      unless board.conflict?
        if row == (queens - 1)
          puts "\n\n"
          puts "Found a solution: \n"
          return render
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
  # s.place_queens
  # s.place_queen(0,0)
  # s.render
  # sleep(1)
  # s.remove_queen(0,0)
  # s.render
end