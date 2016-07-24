class Hand

  attr_reader :cards

  def initialize(cards)
  end

  # returns true if hand contains x number cards of a given value
  def check_cards(x, value)
  end

  #accepts an array of cards and adds to hand
  def add(cards)
  end

  #check hand for book (four of the same value),
  # returns value of book or nil if none found
  def has_book
  end

  #returns array of all cards matching value and removes from hand
  def drop(value)
  end

  #disregard this for assessment (used in working game)
  def display
  end
end
