require 'rspec'
require 'player'

describe Player do
  let(:pot) { double("pot") }
  let(:hand) { double("hand")}
  subject(:player) { Player.new(hand, pot) }

  describe "#initialize" do
    it "should have a pot" do
      expect(player.pot).to eq(pot)
    end

    it "should have a hand" do
      expect(player.hand).to eq(hand)
    end
  end


  describe "#return_cards" do
    it "should return cards from hand to deck"
  end

  describe "#take_cards" do
    it "should take cards from a deck"
  end

  describe "#fold" do
    it "should clear the hand"
  end  

  describe "#raise" do
    it "should add money to the pot"
  end

  describe "#see" do
    it "should add money to the pot"
  end

  describe "#get_input" do
    it "should ask the user which cards they want to discard"
    it "should ask the user if they wish to fold, see, or raise"
  end
end