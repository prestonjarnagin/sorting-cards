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

  def sort
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

  def merge_sort(cards = @cards)
    if cards.count > 1
      mid = cards.count / 2
      left = merge_sort cards.slice(0, mid)
      right = merge_sort cards.slice(mid, cards.count-mid)

      arr = []
      l_index = 0
      r_index = 0
      while l_index < left.count && r_index < right.count
          left_card = left[l_index]
          right_card = right[r_index]

          if left_card.actual_value < right_card.actual_value
              arr << left_card
              l_index += 1
          else
              arr << right_card
              r_index += 1
          end
      end

      while l_index < left.count
          arr << left[l_index]
          l_index += 1
      end

      while r_index < right.count
          arr << right[r_index]
          r_index += 1
      end
      return arr
    end
    return cards
  end


end
