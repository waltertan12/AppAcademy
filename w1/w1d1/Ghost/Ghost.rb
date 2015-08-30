require 'byebug'

class Ghost
  attr_reader   :current_player, :dictionary
  attr_accessor :losses, :players, :fragment

  def initialize(players)
    @players = players
    @current_player = players.first
    @dictionary = import_dictionary('ghost-dictionary.txt')
    @fragment =  ""
    @losses = {}
    players.each {|player| losses[player] = 0}
  end

  def import_dictionary(filename)
    result = {}
    File.readlines(filename).each do |line|
      result[line.chomp] = line.chomp
    end
    result
  end

  def run
    system("clear")
    puts "Get ready for GHOST!!!!"
    puts "Woo start!"
    until @losses.values.include?(5)
      play_round until round_over?
      self.fragment = ""
      self.losses[previous_player] += 1
      puts "You've lost the round, #{previous_player.name}."
      puts "You are now a #{record(previous_player)}"
    end

    puts "And you are the loser, #{previous_player.name}"
    puts "The game is over now... :("
  end

  def record(player)
    "GHOST"[0...losses[player]]
  end

  def play_round
    take_turn(current_player)
    puts "The current fragment is now '#{fragment}'"
    next_player!
  end

  def round_over?
    dictionary.include?(fragment)
  end

  def previous_player
    players.last
  end

  def current_player
    players.first
  end

  def next_player!
    self.players.rotate!
  end

  def take_turn(player)
    puts "Input letter, #{player.name}"
    guess = player.guess
    until valid_play?(guess)
      player.alert_invalid_guess
      guess = player.guess
    end
    self.fragment += guess
  end

  def valid_play?(string)
    return false if string.match(/^[a-zA-Z]$/).nil?
    potential_fragment = fragment + string
    dictionary.any? { |k,v| v.start_with?(potential_fragment) }
  end

  def starts_with?(string, fragment)
    fragment == string[0..fragment.length]
  end

end


class Player
  attr_accessor :name
  def initialize(name)
    @name = name
  end


  def guess
    gets.chomp
  end

  def alert_invalid_guess
    puts "Try again"
  end
end


if __FILE__ == $PROGRAM_NAME
  system("clear")
  puts "Player 1, what is your name?"
  name_one = gets.chomp
  puts "Player 2, what is your name?"
  name_two = gets.chomp
  p1 = Player.new(name_one)
  p2 = Player.new(name_two)
  Ghost.new([p1, p2]).run
end