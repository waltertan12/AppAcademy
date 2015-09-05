class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    return 0 if self.empty?
    hash_value = 0
    self.each_with_index do |elem, index|
      hash_value += (elem.hash + index).hash
    end
    hash_value
  end
end

class String
  def hash
    hash_value = 0
    self.split("").each_with_index do |letter, index|
      hash_value += (letter.ord + index).hash
    end
    hash_value
  end
end

class Hash
  def hash
    hash_value = 0
    self.each do |key, value|
      hash_value += key.hash + value.hash
    end
    hash_value
  end
end
