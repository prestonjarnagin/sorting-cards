require './lib/card'
require 'pry'
class Deck

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def sort()
    length = cards.count-1
    sorted = false
    while !sorted
      sorted = true
      length.times do |i|
        if cards[i].actual_value > cards[i+1].actual_value
          @cards[i], @cards[i+1] = @cards[i+1] , @cards[i]
          sorted = false
        end
      end
    end
    @cards
  end
end
