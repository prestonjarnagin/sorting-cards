require 'minitest/autorun'
require 'minitest/pride'
require './lib/round'

class RoundTest < MiniTest::Test

  def setup
    @card_1 = Card.new("3", "Hearts")
    @card_2 = Card.new("4", "Clubs")
    @deck = Deck.new([@card_1, @card_2])
    @round = Round.new(@deck)
  end
  def test_it_exists
    assert_instance_of Round , @round
  end

  def test_has_deck
    assert_equal @deck , @round.deck
  end

  def test_returns_current_card
    assert_equal @card_1 , @round.current_card
  end

  def test_can_count_guesses
    assert_equal 0 , @round.guesses.count
    @round.record_guess({value: "4", suit: "Hearts"})
    assert_equal 1 , @round.guesses.count
    @round.record_guess({value: "4", suit: "Hearts"})
    @round.record_guess({value: "4", suit: "Hearts"})
    assert_equal 3 , @round.guesses.count
  end

  def test_counts_number_correct
    @round.record_guess({value: "3", suit: "Hearts"})
    assert_equal 1 , @round.number_correct
    @round.record_guess({value: "4", suit: "Clubs"})
    assert_equal 2 , @round.number_correct
    @round.record_guess({value: "3", suit: "Hearts"})
    assert_equal 3 , @round.number_correct
    @round.record_guess({value: "9", suit: "Hearts"})
    assert_equal 3 , @round.number_correct
  end

  def test_record_is_correct
    @round.record_guess({value: "3", suit: "Hearts"})
    @round.record_guess({value: "4", suit: "Clubs"})
    assert_equal "3" , @round.guesses[0].card.value
    assert_equal "Hearts" , @round.guesses[0].card.suit
    assert_equal "4" , @round.guesses[1].card.value
    assert_equal "Clubs" , @round.guesses[1].card.suit
  end

  def test_calculates_percent_correctly
    @round.record_guess({value: "3", suit: "Hearts"})
    assert_equal 100 , @round.percent_correct
    @round.record_guess({value: "4", suit: "Clubs"})
    assert_equal 100 , @round.percent_correct
    @round.record_guess({value: "10", suit: "Hearts"})
    @round.record_guess({value: "10", suit: "Hearts"})
    assert_equal 50 , @round.percent_correct
  end
end
