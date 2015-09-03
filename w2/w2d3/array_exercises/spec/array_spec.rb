require 'rspec'
require 'array'

describe Array do
  describe "#my_uniq" do
    let(:dup_array)    { [1, 2, 1, 3, 3] }
    let(:unique_array) { [1, 2, 3]}

    it "should remove duplicates" do
      uniqed = dup_array.my_uniq
      expect(uniqed).to eq(unique_array)
    end

    it "should not mutate original array" do
      dup_array.my_uniq
      expect(dup_array).to_not eq(unique_array)
    end
  end

  describe "#two_sum" do
    subject(:array_with_matches_1)  { [-1, 0, 2, -2, 1] }
    subject(:array_with_matches_2)  { [-1, -1, 1, 3, 4] }
    subject(:array_without_matches) { [1, 2, 3, 4, 5, 6] }

    it "should find pairs of positions where the elements sum to zero" do
      expect(array_with_matches_1.two_sum).to eq([[0, 4],[2, 3]])
    end

    it "should return an empty array if there are no matches" do
      expect(array_without_matches.two_sum).to be_empty
    end

    it "should find a smaller index before a bigger index" do
      expect(array_with_matches_2.two_sum).to eq([[0, 2],[2, 1]])
    end

    it "should not mutate the original array" do
      array_with_matches_1.two_sum
      expect(array_with_matches_1).to eq([-1, 0, 2, -2, 1])
    end
  end

  describe "#transpose" do
    subject(:square_array) { [[0, 1], [2, 3]] }
    subject(:rectangle) { [[0,1]] }

    it "should convert a row-oriented matrix to a column-oriented matrix" do
      expect(square_array.my_transpose).to eq([[0, 2], [1, 3]])
    end

    it "should not mutate the original array brah" do
      square_array.my_transpose
      expect(square_array).to eq([[0, 1], [2, 3]])
    end
    it "should transpose any 2D matrix" do
      expect(rectangle.my_transpose).to eq([[0],[1]])
    end
  end

  describe "#stock_picker" do
    subject(:stock_prices) { [2, 0, 3, 9] }
    subject(:stock_prices2) {  [13, 0, 9]}

    it "should pick the most profitable pair of days" do
      expect(stock_prices.stock_picker).to eq([1, 3])
    end

    it "shouldn't sell on a day that passed already" do
      expect(stock_prices2.stock_picker).to eq([1, 2])
    end
    
  end

end
