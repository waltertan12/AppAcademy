require 'byebug'
require_relative '00_tree_node'

class KnightPathFinder

  attr_accessor :visited_positions

  def initialize(pos)
    @start_pos = pos
    @visited_positions = [pos]
    @move_tree = build_move_tree #will call build move tree
  end


  def valid_moves(pos)
    deltas =
    [
      [-2, -1],
      [-2,  1],
      [ 2, -1],
      [ 2,  1],
      [ 1, -2],
      [ 1,  2],
      [-1, -2],
      [-1,  2]
    ]
    valid_moves = []
    deltas.each do |delta|
      move = [pos.first + delta.first, pos.last + delta.last]
      valid_moves << move if move.first < 8 && move.first >= 0 &&
                             move.last  < 8 && move.last  >= 0
    end
    valid_moves
  end

  def new_move_positions(pos)
    valid = []
    valid_moves(pos).each do |move|
      if !@visited_positions.include?(move)
        valid << move
        @visited_positions << move
      end
    end
    valid
  end

  def build_move_tree
    parent_move = PolyTreeNode.new(@start_pos)
    queue = [parent_move]

    until queue.empty?
      current_move = queue.shift
      new_moves = new_move_positions(current_move.value)
      new_moves.each do |move|
        m = PolyTreeNode.new(move)
        queue << m
        current_move.add_child(m)
      end
    end
    parent_move
  end

  def find_path(target)
    #raise error
    @move_tree.bfs(target).trace_path_back
  end

end

if __FILE__ == $PROGRAM_NAME
  knight = KnightPathFinder.new([0,0])
  puts knight.find_path([7,6]).to_s
  puts knight.find_path([6,2]).to_s
  puts knight.find_path([10,10]).to_s
end
