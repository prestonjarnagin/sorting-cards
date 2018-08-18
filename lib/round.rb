require './lib/guess'
class Round

  attr_reader :deck,
              :guesses,
              :current_card

  def initialize(deck)
    @deck = deck
    @guesses = []
    @current_card = deck[0]
  end

  def record_guess(guess)
    @guesses << guess
    
    new_guess = Guess.new(guess_reformat,@current_card)
    #Take in guess and current card. Pass to guess class

  end

  def feedback

  end

  def percent_correct

  end

end
