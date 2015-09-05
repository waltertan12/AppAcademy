require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc

    # @max.times {|idx| calc!(idx)}

  end

  def count
    @map.count
  end

  def get(key)
    unless @map[key].nil?
      update_link!(@map[key])
      return @map[key].val
    end

    if @count == @max
      eject!
    end

    @store.insert(key, calc!(key))
    @map[key] = @store.last
    @map[key].val
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    @prc.call(key)
    # @store.insert(key, @prc.call(key))
    # @map[key] = @store.get(key)
  end

  def previous(link)
    current_link = @store.first
    until current_link.nil? || current_link.next == link
      current_link = current_link.next
    end
    current_link
  end

  def update_link!(link)
    # suggested helper method; move a link to the end of the list
    prev_link = previous(link)
    prev_link.next = link.next
    @store.last.next = link
    link.next = nil
  end

  def eject!
    first_link = @store.first.next
    @map.delete(first_link.key)
    @store.first.next = first_link.next
    first_link.next = nil
  end
end
