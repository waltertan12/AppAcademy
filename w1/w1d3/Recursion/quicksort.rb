def quicksort(array, &prc)
  # Add a proc if one is not given
  prc ||= Proc.new { |elem1, elem2| elem1 <=> elem2}

  # Base case
  return array if array.length <= 1

  # Don't alter original array
  working_array = array.dup

  # Select a pivot and remove it from the array
  pivot = working_array.sample
  working_array.delete(pivot)

  # Create arrays to store elements less than the pivot
  # or elements greater than the pivot
  lesser, greater = [], []

  # Filter elements
  working_array.each do |elem|
    case prc.call(pivot, elem)
      when 1
        lesser  << elem
      else
        greater << elem
    end
  end

  quicksort(lesser) + [pivot] + quicksort(greater)
end