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
    guess = Guess.new("#{card[:value]} of #{card[:suit]}", @current_card)
    @guesses << guess
    if guess.correct?
      @number_correct += 1
    end
    @current_card_index += 1
    if @current_card_index == deck.cards.count
      @current_card_index = 0
    end
    @current_card = @deck.cards[@current_card_index]
    guess
  end

  def percent_correct
    (@number_correct.to_f/@guesses.count) * 100.0
  end

end
