require "deck"
require "rspec"


describe Deck do
  subject(:deck) { Deck.new }
  
  let(:unshuffled) { Deck.new.deck }
  
  let(:ace_of_spades ) { double("ace_of_spades", 
                                 suit: :spade, 
                                 value: 14) }
  let(:seven_of_clubs) { double("seven_of_clubs", 
                                 suit: :clubs, 
                                 value: 7) }
  let(:five_of_spades) { double("five_of_spades", 
                                 suit: :spade, 
                                 value: 5) }
  let(:ace_of_hearts)  { double("ace_of_hearts", 
                                 suit: :hearts, 
                                 value: 14) }

  let(:tiny_deck)  {[ace_of_spades,
                     seven_of_clubs,
                     five_of_spades,
                     ace_of_hearts]}



  describe "#initialize" do
    it "should have 52 cards" do
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
