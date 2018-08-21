require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'

class CardTest < MiniTest::Test

  def test_it_exists
    card = Card.new("10", "Hearts")
    assert_instance_of Card , card
  end

  def test_it_has_a_value
    card = Card.new("10", "Hearts")
    assert_equal "10" , card.value
  end

  def test_it_has_a_suit
    card = Card.new("10", "Hearts")
    assert_equal "Hearts" , card.suit
  end

  def test_it_has_an_actual_value
    card_1 = Card.new("10", "Hearts")
    card_2 = Card.new("3", "Spades")
    assert_equal 103 , card_1.actual_value
    assert_equal 34 , card_2.actual_value
  end

end
