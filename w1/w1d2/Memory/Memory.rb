require 'byebug'
require './Board'
require './Card'
require './HumanPlayer'
require './ComputerPlayer'

class Memory
  SLEEP_TIME = 2

  def initialize(player)
    @player = player
    @board = Board.new
    @first_guess = nil
  end

  def play
    welcome

    until board.won?
      play_turn
    end

    game_over_response
  end

  private
    attr_reader   :board, :player
    attr_accessor :first_guess

    def welcome
      puts "Welcome to Memory!"
      puts "Let's get it started, #{player.name}!"
      board.render
    end

    def game_over_response
      puts "You win! You're a winner no matter what anyone else says."
    end

    def play_turn
      # Get first guess
      self.first_guess = get_player_response
      second_guess = get_player_response
      handle_guesses(first_guess, second_guess)
      sleep(SLEEP_TIME)
      system("clear")
      board.render
    end

    def handle_guesses(guess_one, guess_two)
      if board[*guess_one].value == board[*guess_two].value
        puts "You got a match!"
      else
        board[*guess_one].hide
        board[*guess_two].hide
        self.first_guess = nil
      end
    end

    def get_player_response
      guess = get_guess
      system("clear")
      player.receive_revealed_card(board.reveal(guess))
      board.render
      guess
    end

    def valid_guess?(guess)
      guess != first_guess && guess.is_a?(Array) && guess.length == 2 && !board[*guess].state
    end

    def get_guess
      guess = player.make_guess
      until valid_guess?(guess)
        puts "Invalid guess. Try again."
        guess = player.make_guess
      end
      guess
    end
end

if __FILE__ == $PROGRAM_NAME
  puts "What is your name? (If you type 'Computer', the Game will be run with an AI)"
  print "> "
  name = gets.chomp
  if name == 'Computer'
    player = ComputerPlayer.new
  else
    player = HumanPlayer.new(name)
  end
  Memory.new(player).play

  # Uncomment this section to test the Computer Player class
  # 10.times do |idx|
  #   player = ComputerPlayer.new
  #   Game.new(player).play
  #   puts "Game #{idx+1}"
  # end
end
