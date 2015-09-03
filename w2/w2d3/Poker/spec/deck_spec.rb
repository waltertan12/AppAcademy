require "deck"
require "rspec"


describe Deck do
  subject(:deck) { Deck.new }
  let(:unshuffled) { Deck.new.deck }
  let(:tiny_deck) { [Card.new(:hearts, 3),
                    Card.new(:clubs,  7),
                    Card.new(:spades, 5),
                    Card.new(:hearts, 14)]}


  describe "#initialize" do
    it "should have 52 cards w/ no jokers tho!" do
      deck_array = deck.deck
      expect(deck_array.length).to eq(52)
    end

    it "should have Card instances contained in an array" do
      deck_array = deck.deck
      expect(deck_array.first.is_a?(Card)).to be(true)
    end

    it "should accept an array of cards if given" do
      special_deck = Deck.new(tiny_deck)
      expect(special_deck.deck).to eq(tiny_deck)
    end
  end

  describe "#take" do
    it "should take a card and delete from deck" do
      expect(deck.take(1)).to eq(unshuffled.take(1))
      expect(deck.deck.length).to eq(51)
    end

    it "should take multiple cards from deck" do
      expect(deck.take(5)).to eq(unshuffled.take(5))
      expect(deck.deck.length).to eq(47)
    end
  end

  describe "#shuffle" do
    it "should shuffle the deck" do
      deck.shuffle
      shuffled = deck.deck
      expect(shuffled).to_not eq(unshuffled)
    end
  end
end
