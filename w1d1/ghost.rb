class Game
  attr_reader :current_player

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = @player1
    @fragment = ""
    @dictionary = import_dictionary('ghost-dictionary.txt')
  end

  def import_dictionary(filename)
    result = {}
    File.readlines(filename).each do |line|
      result[line] = line
    end
    result
  end

  def play_round
    puts "Woo start!"
    take_turn(@current_player)
    next_player!
  end

  # def current_player
  #   @current_player
  # end

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
    puts "Input guess, #{player.name}!"
    guess = player.guess
    until valid_play?(@fragment + guess)
      puts "Not valid guess: #{@fragment + guess}"
      player.alert_invalid_guess
      guess = player.guess
    end
    @fragment += guess
  end

  def valid_play?(string)
    # puts "#{dictionary}"
    @dictionary.each_key do |key|
      puts "Key: #{key[0..string.length]}, String: #{string}"
      return true if key[0...string.length] == string
    end
    false
    # !@dictionary[string].nil?
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
