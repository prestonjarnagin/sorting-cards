require './lib/card'
class Guess

  attr_reader :guess,
              :card,
              :response

  def initialize(guess, card)
    @guess = guess
    @card = card
    @suit = card.suit
    @value = card.value
    @response = guess
  end

  def correct?
    @guess.split(" of ")[1] == @suit && @guess.split(" of ")[0] == @value
  end

  def feedback
    if correct?
      "Correct"
    else
      "Incorrect"
    end
  end

end
