require 'set'

class WordChainer

  def initialize(dictionary_file_name)
    @dictionary = IO.readlines(dictionary_file_name).map(&:chomp).to_set
  end

  def run(source, target)
    @current_words = [source]
    @all_seen_words = { source => nil }

    until @current_words.empty?
      explore_current_words
    end

    build_path(target)
  end  

  private
    def adjacent_words(word)
      trimmed_dictionary = @dictionary.select {|word1| word1.length == word.length }
      words = Set.new
      trimmed_dictionary.each do |trimmed_word|
        difference = 0
        trimmed_word.length.times do |idx|
          difference += 1 if word[idx] != trimmed_word[idx]
        end

        words.add(trimmed_word) unless difference > 1
      end

      words
    end

    def explore_current_words
      new_current_words = []

      @current_words.each do |current_word|

        adjacent_words(current_word).each do |adj_word|
          unless @all_seen_words.include?(adj_word)
            new_current_words << adj_word
            @all_seen_words[adj_word] = current_word
          end
        end
        # puts "#{current_word}: #{new_current_words}"
        @current_words = new_current_words
      end
    end

    def build_path(target)
      path_array = []
      it_word = target
      until @all_seen_words[it_word] == nil
        puts it_word
        path_array << it_word
        it_word = @all_seen_words[it_word]
      end
      puts it_word
      path_array << it_word
      path_array
    end
end

if __FILE__ == $PROGRAM_NAME
  w = WordChainer.new("dictionary.txt")
  w.run("cats","boot")
end
