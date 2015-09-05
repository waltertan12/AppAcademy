require 'hand'
require 'rspec'

describe Hand do
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

  subject(:deck) { Deck.new([ace_of_spades,
                             seven_of_clubs,
                             five_of_spades,
                             ace_of_hearts]) }

  subject(:hand) { Hand.new(deck) }

  describe "#initialize" do
    it "should initially be empty" do
      cards_in_hand = hand.cards
      expect(cards_in_hand).to be_empty
    end
  end

  describe "#take" do
    it "should take cards from deck and store in hand" do
      expect(hand.take(2)).to eq([ace_of_spades,
                                  seven_of_clubs])
      expect(hand.cards).to   eq([ace_of_spades,
                                  seven_of_clubs])
    end
  end

  describe "#discard" do
    it "should remove a card from the hand" do
      hand.take(1)
      expect(hand.cards).to eq([ace_of_spades])
      hand.discard(0)
      expect(hand.cards).to be_empty
    end
  end

  describe "#check_hand" do
    subject(:royal_flush_deck)    { Deck.new([ Card.new(:hearts, 14),
                                               Card.new(:hearts, 13),
                                               Card.new(:hearts, 12),
                                               Card.new(:hearts, 11),
                                               Card.new(:hearts, 10)])}
    subject(:straight_flush_deck) { Deck.new([ Card.new(:hearts,  9),
                                               Card.new(:hearts,  8),
                                               Card.new(:hearts, 12),
                                               Card.new(:hearts, 11),
                                               Card.new(:hearts, 10)])}
    subject(:four_kind_deck)      { Deck.new([ Card.new(:hearts,   4),
                                               Card.new(:spades,   4),
                                               Card.new(:diamonds, 4),
                                               Card.new(:clubs,    4),
                                               Card.new(:hearts, 10)])}
    subject(:full_house_deck)     { Deck.new([ Card.new(:hearts,  7),
                                               Card.new(:spades,  7),
                                               Card.new(:clubs,   7),
                                               Card.new(:spades,  9),
                                               Card.new(:hearts,  9)])}
    subject(:flush_deck)          { Deck.new([ Card.new(:hearts,  9),
                                               Card.new(:hearts,  6),
                                               Card.new(:hearts,  2),
                                               Card.new(:hearts,  3),
                                               Card.new(:hearts, 11)])}
    subject(:straight_deck)       { Deck.new([ Card.new(:spades,  9),
                                               Card.new(:hearts,  8),
                                               Card.new(:spades,  7),
                                               Card.new(:clubs,   6),
                                               Card.new(:hearts,  5)])}
    subject(:three_kind_deck)     { Deck.new([ Card.new(:hearts,   4),
                                               Card.new(:spades,   4),
                                               Card.new(:diamonds, 4),
                                               Card.new(:clubs,    9),
                                               Card.new(:hearts, 10)])}
    subject(:two_pair_deck)       { Deck.new([ Card.new(:hearts,  7),
                                               Card.new(:spades,  7),
                                               Card.new(:clubs,   3),
                                               Card.new(:spades,  9),
                                               Card.new(:hearts,  9)])}
    subject(:one_pair_deck)       { Deck.new([ Card.new(:hearts,  7),
                                               Card.new(:spades,  7),
                                               Card.new(:clubs,   3),
                                               Card.new(:spades,  8),
                                               Card.new(:hearts,  9)])}
    subject(:high_card_deck)      { Deck.new([ Card.new(:hearts,  6),
                                               Card.new(:spades,  5),
                                               Card.new(:clubs,   3),
                                               Card.new(:spades, 10),
                                               Card.new(:hearts,  9)])}
    it "should recognize a royal flush" do
      hand = Hand.new(royal_flush_deck)
      hand.take(5)
      expect(hand.check_hand).to eq(:royal_flush)
    end

    it "should recognize a straight flush" do
      hand = Hand.new(straight_flush_deck)
      hand.take(5)
      expect(hand.check_hand).to eq(:straight_flush)
    end

    it "Should recognize a four of a kind" do
      hand = Hand.new(four_kind_deck)
      hand.take(5)
      expect(hand.check_hand).to eq(:four_of_a_kind)
    end

    it "should recognize a full house" do
      hand = Hand.new(full_house_deck)
      hand.take(5)
      expect(hand.check_hand).to eq(:full_house)
    end

    it "should recognize a flush" do 
      hand = Hand.new(flush_deck)
      hand.take(5)
      expect(hand.check_hand).to eq(:flush)
    end

    it "should recognize a straight" do
      hand = Hand.new(straight_deck)
      hand.take(5)
      expect(hand.check_hand).to eq(:straight)
    end

    it "should recognize a three of a kind" do
      hand = Hand.new(three_kind_deck)
      hand.take(5)
      expect(hand.check_hand).to eq(:three_of_a_kind)
    end

    it "should recognize a two pair" do
      hand = Hand.new(two_pair_deck)
      hand.take(5)
      expect(hand.check_hand).to eq(:two_pair)
    end

    it "should recognize a high card" do
      hand = Hand.new(high_card_deck)
      hand.take(5)
      expect(hand.check_hand).to eq(:high_card)
    end
  end

  describe "#compare_hands" do
    subject(:three_kind_deck)     { Deck.new([ Card.new(:hearts,   4),
                                               Card.new(:spades,   4),
                                               Card.new(:diamonds, 4),
                                               Card.new(:clubs,    9),
                                               Card.new(:hearts, 10)])}

    it "should know which hand is greater" do
      three_kind_hand = Hand.new(three_kind_deck)
      three_kind_hand.take(5)
      expect(three_kind_hand.compare_hands(:straight)).to eq(:straight)
      expect(three_kind_hand.compare_hands(:high_card)).to eq(:three_of_a_kind)
    end

    it "should handle ties"
  end
end