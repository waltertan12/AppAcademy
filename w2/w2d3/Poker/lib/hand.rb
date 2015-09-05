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
    tiebreak = :none
    if royal_flush?
      hand = :royal_flush
      tiebreak = :none
    elsif straight_flush?
      hand = :straight_flush
      tiebreak = high_card
    elsif of_a_kind?(4)
      hand = :four_of_a_kind

    elsif full_house?
      hand = :full_house

    elsif flush?
      hand = :flush

    elsif straight?
      hand = :straight

    elsif of_a_kind?(3)
      hand = :three_of_a_kind

    elsif two_pair?
      hand = :two_pair

    elsif of_a_kind?(2)
      hand = :two_of_a_kind

    else
      hand = :high_card
    end
    result = {hand: hand, tiebreak: tiebreak}
    result[:hand]
  end

  def kicker
    if two_pair?
      
    elsif of_a_kind?(2)
  end

  def compare_hands(other_hand)
    own_hand = check_hand
    case HAND_PRIORITY.index(own_hand) <=> HAND_PRIORITY.index(other_hand)
      when -1
        own_hand
      when  0 

      when  1
        other_hand
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