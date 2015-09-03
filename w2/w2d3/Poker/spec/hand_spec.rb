require "hand"
require "rspec"

describe Hand do
  subject(:deck) { Deck.new([Card.new(:hearts, 3),
                             Card.new(:clubs,  7),
                             Card.new(:spades, 5),
                             Card.new(:hearts, 14)]) }
  subject(:hand) { Hand.new(deck) }

  describe "#initialize" do
    it "should initially be empty" do
      cards_in_hand = hand.cards
      expect(cards_in_hand).to be_empty
    end
  end

  describe "#take" do
    it "should take cards from deck and store in hand" do
      expect(hand.take(2)).to eq([Card.new(:hearts, 3),
                                  Card.new(:clubs,  7)])
      expect(hand.cards).to eq([Card.new(:hearts, 3),
                                Card.new(:clubs,  7)])
    end
  end

  describe "#discard" do
    it "should remove a card from the hand" do
      expect(hand.take(1)).to eq([Card.new(:hearts, 3)])
      hand.discard(0)
      expect(hand.cards).to be_empty
    end
  end

end
