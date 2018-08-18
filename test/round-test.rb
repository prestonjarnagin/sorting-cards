require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess'
require './lib/deck'

class RoundTest < MiniTest::Test

  def test_it_exists
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_instance_of Round , round
  end

  def test_has_deck
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal deck , round.deck
  end

  def test_returns_current_card
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal card_1 , round.current_card
  end

  def test_can_guess
    
  end

  def test_can_count_guesses

  end

  def test_counts_correct

  end

  def test_calculates_percent_correct

  end
end
