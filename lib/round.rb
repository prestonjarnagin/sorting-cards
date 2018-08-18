require './lib/guess'
require './lib/deck'
require 'pry'
class Round

  attr_reader :deck,
              :guesses,
              :current_card,
              :number_correct

  def initialize(deck)
    @deck = deck
    @current_card = deck.cards[0]
    @guesses = []
    @current_card_index = 0
    @number_correct = 0

  end

  def record_guess(card)
    val = card[:value]

    

  end

end


# card_1 = Card.new("3","Hearts")
# card_2 = Card.new("4", "Clubs")
deck = Deck.new([{value: "Jack", suit: "Diamonds"}])
round = Round.new(deck)
round.record_guess({value: "Jack", suit: "Diamonds"})
