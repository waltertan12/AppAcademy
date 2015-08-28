require_relative 'tic_tac_toe_node'
require 'byebug'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    move_tree = TicTacToeNode.new(game.board, mark)

    moves = move_tree.children.select do |child|
      child.winning_node?(mark)
    end

    if moves.empty?
      moves = move_tree.children.select do |child|
        !child.losing_node?(mark)
      end
    end
    raise if moves.empty?
    moves.sample.prev_move_pos
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
