require 'card'
require 'rspec'

describe Card do
  subject(:card) { Card.new(:spades, :five) }

  describe "#initialize" do
    it "should accept a VALID suit and value" do
      expect{ Card.new("blimp", 400) }.to raise_error(
      "You need a real suit and value bruh."
      )
    end
  end

  describe "#suit" do
    it "should return the suit of card" do
      expect(card.suit).to be(:spades)
    end
  end

  describe "#value" do
    it "should return the value of the card" do
      expect(card.value).to be(:five)
    end
  end

end
