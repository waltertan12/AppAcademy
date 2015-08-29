class Tile
  attr_reader   :neighbors

  def initialize(bomb)
    @value     = "-"    # "-" indicates an unexplored cell
    @bomb      = bomb   # true if Tile contains a bomb, false, otherwise
    @revealed  = false
    @flagged   = false
    @neighbors = []     # Store neighboring Tiles into an Array
    # @position  = nil
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

  def add_neighbor(neighbor)
    neighbors << neighbor
  end

  def neighbor_bomb_count
    bomb_count = 0
    neighbors.each do |neighbor|
      bomb_count += 1 if neighbor.bombed?
    end
    bomb_count
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
    # "<Tile##{self.object_id}>, Position: #{position}, Value: '#{value}'"
    "<Tile##{self.object_id}>, Value: '#{value}'"
  end

  private
    attr_accessor :revealed, :flagged, :value#, :position
end