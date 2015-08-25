class Game
  attr_reader :current_player, :dictionary

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = @player1
    @fragment = ""
    @dictionary = import_dictionary('ghost-dictionary.txt')
    @losses = {@player1 => 0, @player2 => 0}
  end

  def import_dictionary(filename)
    result = {}
    File.readlines(filename).each do |line|
      result[line.chomp] = line.chomp
    end
    result
  end

  def run
    until @losses.values.include?(5)
      play_round
      @fragment = ""
    end
    puts "And you are the loser"
    puts "The game is over now... :("
  end

  def record(player)
    "GHOST"[0...@losses[player]]
  end

  def play_round
    puts "Woo start!"
    until round_over?
      take_turn(@current_player)
      puts "The current fragment is now #{@fragment}"
      next_player!
    end
    @losses[previous_player] += 1
    puts "You suck, #{previous_player.name}."
    puts "You are now a #{record(previous_player)}"
  end

  def round_over?
    !@dictionary[@fragment].nil?
  end

  def previous_player
    if @current_player == @player1
      @player2
    else
      @player1
    end
  end

  def next_player!
    @current_player = previous_player
  end

  def take_turn(player)
    puts "Input letter, #{player.name}"
    guess = player.guess
    until valid_play?(guess)
      player.alert_invalid_guess
      guess = player.guess
    end
    @fragment += guess
  end

  def valid_play?(string)
    return false if string.match(/^[a-zA-Z]$/).nil?
    potential_fragment = @fragment + string
    @dictionary.each_key do |key|
      return true if key[0...potential_fragment.length] == potential_fragment
    end
    false
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
