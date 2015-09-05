require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
include Enumerable

  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    self.each do |elem_key, val|
      return true if elem_key == key
    end
    false
  end

  def set(key, val)
    resize! if count == num_buckets
    @store[bucket(key)].insert(key, val)
    @count += 1
  end

  def get(key)
    @store[bucket(key)].get(key)
  end

  def delete(key)
    @store[bucket(key)].remove(key)
    @count -= 1
  end

  def each(&prc)
    @store.each do |list|
      list.each {|elem| prc.call(elem.key, elem.val)}
    end
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_buckets = num_buckets * 2
    new_store = Array.new(new_buckets) { LinkedList.new }

    self.each do |key, val|
      new_store[key.hash % new_buckets].insert(key, val)
    end

    @store = new_store
  end

  def bucket(key)
    key.hash % num_buckets
  end
end
