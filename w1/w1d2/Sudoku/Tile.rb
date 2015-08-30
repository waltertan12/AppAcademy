require 'colorize'
class Tile
  attr_reader :value

  def initialize(value = 0)
    @value = value
    @given = (value == 0 ? false : true)
  end

  def to_s
    if given?
      value.to_s.colorize(:light_white)
    else
      if value == 0
        value.to_s.colorize(:red)
      else
        value.to_s.colorize(:green)
      end
    end
  end

  def given?
    @given
  end

  def value=(new_value)
    if given?
      puts "You can't change the value of a given tile"
    else
      @value = new_value
    end
  end

end
