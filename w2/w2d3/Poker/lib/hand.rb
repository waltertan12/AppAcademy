require_relative 'deck'

class Hand
  attr_accessor :cards, :suits_hash, :value_hash
  attr_reader   :deck

  HAND_PRIORITY = [
    :royal_flush,
    :straight_flush,
    :four_of_a_kind,
    :full_house,
    :flush,
    :straight,
    :three_of_a_kind,
    :two_pair,
    :one_pair,
    :high_card
  ]

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
      suits_hash[card.suit]  += 1
    end
  end

  def discard(index)
    card_to_delete = cards[index]

    value_hash[card_to_delete] -= 1
    suits_hash[card_to_delete] -= 1

    cards.delete_at(index)
  end

  def check_hand
    if royal_flush?
      :royal_flush
    elsif straight_flush?
      :straight_flush
    elsif of_a_kind?(4)
      :four_of_a_kind
    elsif full_house?
      :full_house
    elsif flush?
      :flush
    elsif straight?
      :straight
    elsif of_a_kind?(3)
      :three_of_a_kind
    elsif two_pair?
      :two_pair
    elsif of_a_kind?(2)
      :two_of_a_kind
    else
      :high_card
    end
  end

  private

  def flush?
    suit_to_check = cards.first.suit
    cards.all? { |card| card.suit == suit_to_check }
  end

  def royal_flush?
    flush? && straight? && high_card.value == 14
  end

  def straight_flush?
    flush? && straight?
  end

  def high_card
    cards.sort.last
  end

  def straight?
    sorted_cards = cards.sort
    (0...sorted_cards.length-1).each do |idx|
      return false if (sorted_cards[idx].value + 1) != sorted_cards[idx+1].value
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