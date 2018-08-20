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
    guess_string = "#{card[:value]} of #{card[:suit]}"
    guess = Guess.new(guess_string, @current_card)
    @guesses << guess
    if guess.correct?
      @number_correct += 1
    end
    deck.cards.rotate!
    @current_card = deck.cards[0]
    guess
  end

  def percent_correct
    (@number_correct.to_f/@guesses.count) * 100.0
  end

end
