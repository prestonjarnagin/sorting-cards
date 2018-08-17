require 'minitest/autorun'
require 'minitest/pride'

class CardTest < MiniTest::Test

  def test_it_exists
    card = Card.new(10, "Hearts")
    assert_instance_of Card, card
  end

  def test_it_has_a_value
    card = Card.new(10, "Hearts")
    assert_equal "10" , card.value
  end

  def test_it_has_a_suit
    card = Card.new(10, "Hearts")
    assert_equal "Hearts" , card.suit
  end

end
