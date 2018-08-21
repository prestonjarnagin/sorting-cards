require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'

class CardTest < MiniTest::Test

  def setup
    @card_1 = Card.new("10", "Hearts")
    @card_2 = Card.new("3", "Spades")
  end
  def test_it_exists
    assert_instance_of Card , @card_1
  end

  def test_it_has_a_value
    assert_equal "10" , @card_1.value
    assert_equal "3" , @card_2.value
  end

  def test_it_has_a_suit
    assert_equal "Hearts" , @card_1.suit
    assert_equal "Spades" , @card_2.suit
  end

  def test_it_has_an_actual_value
    assert_equal 103 , @card_1.actual_value
    assert_equal 34 , @card_2.actual_value
  end

end
