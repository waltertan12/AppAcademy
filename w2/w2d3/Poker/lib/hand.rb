require_relative 'deck'

class Hand
  attr_accessor :cards, :suits_hash, :value_hash
  attr_reader   :deck

  def initialize(deck)
    @deck = deck
    @cards = []
    @value_hash = Hash.new { |h,k| h[k] = 0 }
    @suits_hash = Hash.new { |h,k| h[k] = 0 }
  end

  def take(num_of_cards)
    self.cards += deck.take(num_of_cards)
    cards.each do |card|
      value_hash[card.value] += 1
      suits_hash[card.suit] += 1
    end
  end

  def discard(index)
    card_to_delete = card[index]

    value_hash[card_to_delete] -= 1
    suits_hash[card_to_delete] -= 1

    cards.delete_at(index)
  end

  def flush?
    suit_to_check = cards.first.suit
    cards.all? { |card| card.suit == suit_to_check }
  end

  def royal_flush?
    flush? && straight?
  end

  def straight?
    (0...cards.length-1).each do |idx|
      return false if cards[idx] > cards[idx+1]
    end
    true
  end

  def of_a_kind?(n)
    value_hash.values.any? { |v| v == n }
  end

  def full_house?
    value_hash.values.any? { |v| v == 3 } &&
    value_hash.values.any? { |v| v == 2 }
  end

  def two_pair?
    found_pairs_count = 0
    value_hash.values.each do |value|
      found_pairs_count += 1 if value == 2
    end
    found_pairs_count == 2
  end

end
