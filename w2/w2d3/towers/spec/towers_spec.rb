require 'towers'
require 'rspec'

describe Towers do
  subject(:tower) { Towers.new }

  describe "#initialize" do
    subject(:tower2) { Towers.new(5) }

    it "should initialize with a stack of towers" do
        expect(tower.stack).to eq([[3, 2, 1], [], []])
    end

    it "should accept stack with passed arguments" do
      expect(tower2.stack).to eq(5)
    end
  end

  describe "#move" do
    it "should move one disc to another tower" do
      tower.move(0, 1)
      expect(tower.stack).to eq([[3, 2], [1], []])
    end

    it "should not move a bigger disk onto a smaller disc" do
      tower.move(0, 1)
      expect{tower.move(0, 1)}.to raise_error("oh no you can't do that")
    end

    it "should not let you select an empty tower" do
      expect{tower.move(1, 1)}.to raise_error("oh no you can't do that")
    end
  end

  describe "#won?" do
    subject(:winning_1) { [[],[],[3, 2, 1]] }
    subject(:winning_2) { [[],[3, 2, 1],[]] }
    subject(:intermediate) { [[3], [2], [1]] }

    it "should recognize when it's a winning state" do
      towers = Towers.new(winning_1)
      expect(towers.won?).to be(true)

      towers2 = Towers.new(winning_2)
      expect(towers2.won?).to be(true)

      towers3 = Towers.new(intermediate)
      expect(towers3.won?).to be(false)
    end

    it "should not recognize initialized Tower as a win" do
      expect(tower.won?).to be(false)
    end
  end

  describe "#render" do
    it "should print the stack to the screen" do
      expect(tower).to receive(:stack)
      tower.render
    end
  end
end
