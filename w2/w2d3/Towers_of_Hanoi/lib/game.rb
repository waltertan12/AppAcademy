require_relative 'player'
require_relative 'towers'

class Game
  def initialize(player)
    @towers = Towers.new
    @player = player
  end

  def play
    play_turn until @towers.won?
    game_over_response
  end

  private

  def play_turn
    @towers.render
    moves = @player.get_move
    from = moves[:from]
    to = moves[:to]
    @towers.move(from, to)
  end

  def game_over_response
    puts "Yey"
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "What is your name?"
  print ">"
  name = gets.chomp
  player = Player.new(name)
  Game.new(player).play  
end