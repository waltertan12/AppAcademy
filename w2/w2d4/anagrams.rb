def first_anagram(string, string2) # time complexity is n * n!
  anagrams = string.split("").permutation.map { |anagram| anagram.join("") }
  anagrams.include?(string2)
end

def second_anagram(string, string2) # time complexity is n^2
  return false unless string.length == string2.length
  i = 0
  until string.empty?
    char = string[i]
    if string2.include?(char)
      string2.sub!(char, "")
    end
      string.sub!(char, "")
  end
  string2.empty?
end

def third_anagram(string, string2) # time complexity is worst case n^2, best/avg case n log(n)
  string.split("").sort == string2.split("").sort
end

def fourth_anagram(string, string2) # time complexity is O(n)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)
  (0...string.length).each do |index|
    hash1[string[index]] += 1 # constant
    hash2[string2[index]] += 1
  end
  hash1 == hash2
end

def fourth_anagramii(string, string2)
  hash = Hash.new(0)
  (0...string.length).each do |index|
    hash1[string[index]] += 1
    hash2[string2[index]] -= 1
  end
  hash.values.all?(0)
end

if __FILE__ == $PROGRAM_NAME
  start = Time.now
  first_anagram("aaaaabzzzzz", "aaaabazzzzz")
  puts "First method: #{Time.now - start}"

  start = Time.now
  second_anagram("aaaaabzzzzz", "aaaabazzzzz")
  puts "Second method: #{Time.now - start}"

  start = Time.now
  third_anagram("aaaaabzzzzz", "aaaabazzzzz")
  puts "third method: #{Time.now - start}"

  start = Time.now
  fourth_anagram("aaaaabzzzzz", "aaaabazzzzz")
  puts "fourth method: #{Time.now - start}"
end
