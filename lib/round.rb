require './lib/guess'
class Round

  attr_reader :deck,
              :guesses,
              :current_card

  def initialize(deck)
    @deck = deck
    @guesses = []
    @current_card_index = 0
    @current_card = deck[0]
    @number_correct = 0
  end

  def record_guess(guessed_card)
    new_guess = Guess.new(guessed_card, @current_card)
    @guesses << new_guess
    if new_guess.correct?
      @number_correct += 1
    end
    @current_card_index += 1
    if @deck[@current_card_index] = nil
      @current_card_index = 0
    end

  end

  def percent_correct
    (@number_correct / @guesses.length) * 100
  end

end
