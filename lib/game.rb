require_relative 'player'
require_relative 'hand'
require_relative 'card'
require_relative 'deck'
require 'byebug'

class Game

  def set_up_players(num_players)
    @players = []
    num_players.times do |i|
      @players << Player.new("Player#{i}")
    end
    @players
  end

  def initialize(num_players)
    @players = set_up_players(num_players)
    @deck = Deck.new
    @current_player = @players.first
    run_game
  end

  def run_game
    @deck.shuffle!
    deal
    play_round until game_over?
  end

  def play_round
    good_guess=true
    while good_guess
      puts "#{@current_player.name}'s turn.  Now holding: "
      puts @current_player.hand.display
      puts

      target_player, value = player_guess
      good_guess = @current_player.asks_for_card(target_player, value)
      @current_player.gimme_da_cards(target_player, value) if good_guess
      lay_down_books while @current_player.hand.has_book
      return if game_over?
      puts "GOOD GUESS!" if good_guess
    end
    puts "GO FISH!!"
    puts
    @current_player.go_fish(@deck) unless @deck.cards.empty?
    switch_current_player
  end

  def player_guess
    good_guess = false
    until good_guess
      puts "Ask which player?  0-#{@players.count - 1}?"
      who = @players[gets.chomp.to_i]
      good_guess = true if who != @current_player
    end
    puts "For which card value (1-13)?"
    what = gets.chomp.to_i
    [who, what]
  end


  def deal
    @players.size > 4 ? deal_size = 5 : deal_size = 7
    @players.each do |player|
      deal_size.times do
        player.hand.add(@deck.get_card)
      end
    end
  end

  def game_over?
    @deck.cards.empty? && @players.all?{|player| player.cards = []}
  end

  def switch_current_player
    if @current_player == @players.last
      @current_player = @players.first
    else
      @current_player = @players[@players.index(@current_player)+1]
    end
  end
end#class

Game.new(3)
