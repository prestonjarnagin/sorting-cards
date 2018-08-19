require 'minitest/autorun'
require 'minitest/pride'
require './lib/round'

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

  def test_can_record_guess
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    round.record_guess({value: "4", suit: "Hearts"})
    assert_equal 1 , round.guesses.count
    round.record_guess({value: "4", suit: "Hearts"})
    round.record_guess({value: "4", suit: "Hearts"})
    assert_equal 3 , round.guesses.count

  end

  def test_counts_correct
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess({value: "3", suit: "Hearts"})
    assert_equal 1 , round.number_correct
    round.record_guess({value: "4", suit: "Clubs"})
    assert_equal 2 , round.number_correct
    round.record_guess({value: "3", suit: "Hearts"})
    assert_equal 3 , round.number_correct
    round.record_guess({value: "9", suit: "Hearts"})
    assert_equal 3 , round.number_correct

  end

  def test_calculates_percent_correctly
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess({value: "3", suit: "Hearts"})
    assert_equal 100 , round.percent_correct
    round.record_guess({value: "4", suit: "Clubs"})
    assert_equal 100 , round.percent_correct
    round.record_guess({value: "10", suit: "Hearts"})
    round.record_guess({value: "10", suit: "Hearts"})
    assert_equal 50 , round.percent_correct

  end
end
