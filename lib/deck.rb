class Deck

  attr_reader :cards

  #factory method, returns an array containing 52 new card objects of
  #all suits and values
  def self.all_cards
  end

  #initializess with 52 cards
  def initialize(cards = Deck.all_cards)
  end


  #retrieves one card from the deck in an array
  def get_card
  end

  #shuffles cards
  def shuffle!
  end

end#class
