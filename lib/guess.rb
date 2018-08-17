require './lib/card'
class Guess

  attr_reader :guess,
              :card

  def initialize (guess, card)
    @guess = guess
    @card = card
    @suit = ""
    @value = ""
  end

  def response
    "#{card.value} of #{card.suit}"
  end

  def correct?
    @guess.split(" of ")[1] == @card.suit && @guess.split(" of ")[0] == @card.value
  end

  def feedback
    if correct?
      "Correct"
    end
    "Incorrect"
  end

end
