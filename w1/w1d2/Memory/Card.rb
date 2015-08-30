class Card
  attr_reader :value, :state

  VALUES = [
    "Two",
    "Three",
    "Four",
    "Five",
    "Six",
    "Seven",
    "Eight",
    "Nine",
    "Ten",
    "Jack",
    "Queen",
    "King",
    "Ace"
  ]

  def initialize
    @value = VALUES.sample
    @state = false
  end

  def hide
    self.state = false
  end

  def reveal
    self.state = true
    value
  end

  def to_s
    if state
      pad(value.to_s)
    else
      pad('x')
    end
  end

  def ==(card)
    value == card.value
  end

  private
    attr_writer :state
    
    # Make sure each string is 6 characters long by padding with spaces
    def pad(string)
      until string.length == 6
        string += " "
      end
      string
    end
end
