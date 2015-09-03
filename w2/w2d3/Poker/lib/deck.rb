require_relative 'card'
require 'byebug'

class Deck
  attr_accessor :deck

  def initialize(deck = create_deck)
    @deck = deck
  end

  def shuffle
    deck.shuffle!
  end

  def take(number_of_cards)
    # debugger
    taken_cards = deck.take(number_of_cards)
    self.deck = self.deck.drop(number_of_cards)
    taken_cards
  end


  private
  def create_deck
    decks = []

    Card.suits.each do |suit|
      Card.values.each do |value|
        decks << Card.new(suit, value)
      end
    end

    decks
  end
end
