require 'byebug'

class HumanPlayer
  attr_reader :color

  def initialize(color, board)
    @color = color
    @board = board
  end

  def get_input(display)
    display.get_input
  end
end

class ComputerPlayer
  attr_reader :color, :board, :level

  Points = {
    EmptyPiece  =>  0,
    Pawn   =>  1,
    Bishop =>  3,
    Knight =>  5,
    Rook   =>  7,
    Queen  =>  9,
    King   => 13
  }

  def initialize(color, board, level = 5)
    @color = color
    @opposing_color = (color == :black ? :white : :black)
    @board = board
    @level = level
    @piece_to_move = nil
    @next_move = nil
    @move_from = nil
    @move_to = nil
  end

  # def get_input(display)
  #   sleep(0.025)
  #   if @move_from.nil?
  #     piece_and_move = select_smarter
  #     p piece_and_move
  #     @piece_to_move = piece_and_move.first
  #     @next_move     = piece_and_move.last
  #     coords         = @piece_to_move.position
  #   else
  #     coords = @next_move
  #     @next_move, @piece_to_move = nil, nil
  #   end
  #   coords
  # end

  def get_input(display)
    sleep(0.025)
    
    if @move_from.nil?
      moves = minimax(board, true, 3, 9999999, -9999999)
      @move_from = moves[:move_from]
      @move_to   = moves[:move_to]
      coords     = @move_from
    else
      coords = @move_to
      @move_from, @move_to = nil, nil
    end

    coords
  end

  def minimax(board, player, depth, min, max)
    return utility(board) if depth == 0

    
    
    # gotta DRY this out soon
    if player
      best_move = {score: max, move_from: nil, move_to: nil}

      my_pieces(board).each do |piece|
        piece.legal_moves.each do |move|
          duped_board = board.dup
          current_piece = duped_board[*piece.position]

          duped_board.move(current_piece, move)
          score = minimax(duped_board, false, depth - 1, min, max)
          break if score[:score] >= min

          if score[:score] > max
            max = score[:score]
            best_move = {score: score[:score], move_from: piece.position, move_to: move}
          end
        end
      end

      return best_move
    else
      best_move = {score: min, move_from: nil, move_to: nil}

      my_pieces(board).each do |piece|
        piece.legal_moves.each do |move|
          duped_board = board.dup
          current_piece = duped_board[*piece.position]

          duped_board.move(current_piece, move)
          score = minimax(duped_board, true, depth - 1, min, max)

          break if score[:score] <= max

          if score[:score] < min
            min = score[:score]
            best_move = {score: score[:score], move_from: piece.position, move_to: move}
          end
        end
      end
      
      return best_move
    end
  end

  def utility(board)
    my_pieces = my_pieces(board)
    opponent_pieces = opponent_pieces(board)

    my_score = 0
    opponent_score = 0

    my_pieces.each do |piece|
      my_score += Points[piece.class]
    end

    opponent_pieces.each do |piece|
      opponent_score += Points[piece.class]
    end

    {score: my_score - opponent_score}
  end

  def select_smarter
    score, piece, move = nil, nil, nil

    first_moves = children(board, my_pieces(board))

    first_moves.each do |move_hash|
      current_board = move_hash[:board]
      # Check outcomes of making the first move i.e. see two moves ahead
      c = children(current_board, opponent_pieces(current_board))
      c.each do |second_move_hash|
        move_hash[:score] += second_move_hash[:score]
      end
    end

    first_moves.each do |move_hash|
      if score.nil? || move_hash[:score] > score
        score = move_hash[:score]
        piece = move_hash[:piece]
        move  = move_hash[:move]
      end
    end

    if score == 0
      piece_and_move = first_moves.sample
      piece = piece_and_move[:piece]
      move  = piece_and_move[:move]
    end

    [piece, move]
  end

  def take_piece?(tile)
    tile.occupied? && tile.color == @opposing_color
  end

  def lose_piece?(tile)
    tile.occupied? && tile.color == @color
  end

  # def children_two(parent_board, pieces)
  #   children_arr = []

  #   pieces.each do |piece|
  #     piece.legal_moves.each do |move|
  #       duped_board = parent_board.dup
  #       current_piece = duped_board[*piece.position]
  #       tile = duped_board[*move]

  #       duped_board.move(current_piece, move)
  #       children_arr << {
  #         board: duped_board, 
  #         piece: piece, 
  #         move_from: piece.position, 
  #         move_to: move
  #       }
  #     end
  #   end

  #   children_arr
  # end

  def children(parent_board, pieces)
    children_arr = []
    score = 0
    pieces.each do |piece|
      piece.legal_moves.each do |move|
        duped_board = parent_board.dup
        current_piece = duped_board[*piece.position]
        tile = duped_board[*move]

        if take_piece?(tile)
          score += Points[tile.class]
        elsif lose_piece?(tile)
          score -= Points[tile.class]
        end
        duped_board.move(current_piece, move)
        children_arr << {board: duped_board, piece: piece, move: move, score: score}
      end
    end
    children_arr
  end

  def my_pieces(board)
    board.all_pieces.select do |piece|
      piece.color == color
    end
  end

  def opponent_pieces(board)
    board.all_pieces.select do |piece|
      piece.color != color
    end
  end
end