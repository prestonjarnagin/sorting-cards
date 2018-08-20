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
    sorted = []
    index = 0

    while index < @cards.count
      if @cards[index].value > @cards[index+1].value
        @cards[index+1] = sorted[index]
        @cards[index] = sorted[index+1]
      end
      index += 1
    end

    binding.pry
    sorted
  end

  # def merge_sort(cards)
  #   sorted = []
  #   if cards.count > 1
  #     middle  = cards.length / 2
  #     first   = cards[0..middle]
  #     second  = cards[middle..-1]
  #
  #     sort(first)
  #     sort(second)
  #
  #     index_1      = 0
  #     index_2      = 0
  #     sorted_index = 0
  #
  #   end
  # end

end
