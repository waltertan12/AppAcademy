require 'byebug'

class ComputerPlayer
  attr_reader   :name, :known_cards
  attr_accessor :last_guess, :num_of_guesses, :correct_guess, :matched_cards,
                :guesses

  def initialize
    @name = "Computer Player 9000"
    @known_cards = {}     # Store cards that have been seen
    @matched_cards = []   # Store cards that have been matched
    @correct_guess = []   # Store guesses that will result in matches
    @last_guess = nil
    @guesses = []

    # Map out all possible guesses
    self.guesses = (0..3).map do |idx1|
      (0..3).map { |idx2| [idx1, idx2] }
    end.flatten(1)
  end

  def make_guess
    check_for_matches

    # If there are no matches, guess randomly
    if correct_guess.empty?
        guess = guesses.sample

      # Remove guess from possible guesses
      guesses.delete(guess)

      # Try to find a match
      receive_match(guess, last_guess)
    else
      guess = self.correct_guess.shift
    end

    self.last_guess = guess
    guess
  end

  def check_for_matches
    # If a card has been seen at two different locations add that to the known matches
    known_cards.each do |pos, value|
      if known_cards.values.count(value) == 2 && 
         !matched_cards.include?(pos)

        # Add matched position to correct_guess
        self.correct_guess += known_cards.keys.select do |key|
          known_cards[key] == value    && 
          !correct_guess.include?(key) &&
          !matched_cards.include?(key)
        end

        # Remove a guess that has already been matched
        receive_match(correct_guess[-1], correct_guess[-2])
      end
    end
  end

  def receive_revealed_card(card_value)
    known_cards[last_guess] = card_value
  end

  def receive_match(pos1, pos2)
    if !pos1.nil? && !pos2.nil?               &&
       known_cards[pos1] == known_cards[pos2] && 
       pos1 != pos2  

      # Move match positions from guesses to matched_cards
      matched_cards << pos1 unless matched_cards.include?(pos1)
      matched_cards << pos2 unless matched_cards.include?(pos2)
      
      guesses.delete_if { |el| el == pos1 || el == pos2 }
    end
  end
end
