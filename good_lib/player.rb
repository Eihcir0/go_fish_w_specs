class Player

  attr_accessor :name, :hand, :books

  def initialize(name)
  end

  def cards
  end

  #checks if another player has given value, returns true or false
  def asks_for_card(another_player, value)
  end

  #transfers card(s) from other players hand into own hand
  def gimme_da_cards(another_player, value)
  end

  #gets a card from the deck and puts it into the players hand
  def go_fish(deck)
  end

  #moves book into book array and removes from hand
  def lays_down_book
  end


end#class
