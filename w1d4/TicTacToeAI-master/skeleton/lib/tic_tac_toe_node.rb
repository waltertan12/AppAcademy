require 'byebug'
require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)

    if @board.over?
      return false if @board.winner == evaluator || @board.winner.nil?
      return true
    end

    if evaluator == next_mover_mark #us
      self.children.all? { |child_board| child_board.losing_node?(evaluator) }
    else #opponent move
      self.children.any? {|child_board|  child_board.losing_node?(evaluator) }
    end
  end

  def winning_node?(evaluator)
    if @board.over?
      return @board.winner == evaluator
    end

    if evaluator == next_mover_mark #us
      self.children.any? { |child_board| child_board.winning_node?(evaluator)}
    else #opponent move
      self.children.all? {|child_board|  child_board.winning_node?(evaluator) }
    end

  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    child_arr = []
    0.upto(2) do |row|
      0.upto(2) do |col|
        pos = [row, col]
        if board.empty?(pos)
          new_board = board.dup

          if next_mover_mark == :x
            mark = :o
            new_board[pos] = :x
          else
            mark = :x
            new_board[pos] = :o
          end
          child_arr << TicTacToeNode.new(new_board, mark, pos)
        end
      end
    end
    child_arr
  end
end
