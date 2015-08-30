require_relative 'Board'

class Queen
  attr_reader :symbol

  def initialize(symbol)
    @symbol = symbol 
  end

  def to_s
    symbol
  end

  def inspect
    symbol
  end
end