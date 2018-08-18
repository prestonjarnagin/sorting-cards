require './lib/card'
class Guess

  attr_reader :guess,
              :card,
              :response

  def initialize(guess, card)
    @guess = guess
    @card = card
    @suit = ""
    @value = ""
    @response = make_response
  end

  def make_response
    "#{card.value} of #{card.suit}"
  end

  def correct?
    @guess.split(" of ")[1] == @card.suit && @guess.split(" of ")[0] == @card.value
  end

  def feedback
    if correct?
      "Correct"
    else
      "Incorrect"
    end
  end

end
