class Tile
  def initialize(bomb, board, pos)
    @bomb      = bomb   # true if Tile contains a bomb, false, otherwise
    @board     = board
    @position  = pos
    @value     = "-"    # "-" indicates an unexplored cell
    @revealed  = false
    @flagged   = false
  end

  def reveal
    self.revealed = true
    if bombed?
      self.value  = "💥"
    else
      self.value  = neighbor_bomb_count
    end
  end

  def flag
    self.flagged = true
    self.value   = "🚩"
  end

  def unflag
    self.flagged = false
    self.value   = "-"
  end

  def neighbors
    if @neighbors.nil? || @neighbors.empty?
      @neighbors = []
      neighboring_tiles = []

      x, y = position.first, position.last

      DELTAS.each do |delta|
        dx, dy = delta.first, delta.last
        neighboring_tiles << board[[x + dx, y + dy]] if valid?(x + dx, y + dy)
      end

      @neighbors = neighboring_tiles
    else
      @neighbors
    end
  end

  def add_neighbor(neighbor)
    neighbors << neighbor unless neighbors.include?(neighbor)
  end

  def neighbor_bomb_count
    bomb_count = 0
    neighbors.each do |neighbor|
      bomb_count += 1 if neighbor.bombed?
    end
    bomb_count
  end

  def valid?(x, y)
    x >= 0 && x < 9 && y >= 0 && y < 9
  end

  def bombed?
    bomb
  end

  def flagged?
    flagged
  end

  def revealed?
    revealed
  end

  def to_s
    value
  end

  def inspect
    "<Tile##{self.object_id}>, Position: #{position}, Value: '#{value}'"
  end

  private
    attr_accessor :revealed, :flagged, :value, :position, :bomb
    attr_reader   :board

    DELTAS = [
      [ 0, -1],
      [ 0,  1],
      [ 1, -1],
      [ 1,  0],
      [ 1,  1],
      [-1, -1],
      [-1,  0],
      [-1,  1],
    ]
end