class Card
  attr_reader :suit, :value

  SUITS = [:hearts, :spades, :clubs, :diamonds]
  VALUES = (2..14).to_a

  def initialize(suit, value)
    unless SUITS.include?(suit) || VALUES.include?(value)
      raise "You need a real suit and value bruh."
    end

    @suit, @value = suit, value
  end

  def self.suits
    SUITS
  end

  def inspect
    "#{value} of #{suit}"
  end

  def ==(card)
    card.suit == suit &&
    card.value == value
  end

  def <=>(card)
    value <=> card.value
  end

  def self.values
    VALUES
  end
end
