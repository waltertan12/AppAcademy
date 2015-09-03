class Array

  def my_uniq
    uniq_array = []
    self.each { |elem| uniq_array << elem unless uniq_array.include?(elem) }
    uniq_array
  end

  def two_sum
    result = []
    result
  end

end
