class Player
  def initialize(name)
    @name = name
  end

  def get_move
    puts "Pick a disc"
    from = gets.chomp.to_i
    puts "Pick where to move the disc"
    to = gets.chomp.to_i
    {from: from, to: to}
  end
end
