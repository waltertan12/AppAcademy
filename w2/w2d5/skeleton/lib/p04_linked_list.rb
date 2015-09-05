class Link
  attr_accessor :key, :val, :next

  def initialize(key = nil, val = nil, nxt = nil)
    @key, @val, @next = key, val, nxt
  end

  def to_s
    "#{@key}, #{@val}"
  end
end

class LinkedList
  include Enumerable
  attr_reader :head

  def initialize
    @head = Link.new
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    head
  end

  def last
    next_link = head.next
    until next_link.nil?
      return next_link if next_link.next.nil?
      next_link = next_link.next
    end

    head
  end

  def empty?
    head.next.nil?
  end

  def get(key)
    next_link = head.next
    self.each do |link|
      return link.val if link.key == key
    end
    nil
  end

  def include?(key)
    self.each do |link|
      return true if link.key == key
    end
    false
  end

  def insert(key, val)
    new_link = Link.new(key, val)
    last.next = new_link
  end

  def remove(key)
    prev_link = head
    next_link = head.next
    until next_link.nil?
      if next_link.key == key
        prev_link.next = next_link.next
      end
      prev_link = next_link
      next_link = next_link.next
    end
    nil
  end

  def each(&prc)
    next_link = head.next
    until next_link.nil?
      prc.call(next_link)
      next_link = next_link.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
