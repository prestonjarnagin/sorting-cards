require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess'

class GuessTest < MiniTest::Test

  def setup
    @card = Card.new("10", "Hearts")
    @incorrect_card = Card.new("7", "Spades")
    @guess = Guess.new("10 of Hearts", @card)
  end
  def test_it_exists
    assert_instance_of Guess , @guess
  end

  def test_has_card
    assert_equal @card , @guess.card
  end

  def test_has_response
    assert_equal "10 of Hearts" , @guess.response
  end

  def test_handles_incorrect_response
    refute_equal "9 of Diamonds" , @guess.response
  end

  def test_guesses_correctly
    assert @guess.correct?
  end

  def test_handels_incorrect_guess
    guess = Guess.new("10 of Hearts", @incorrect_card)
    refute guess.correct?
  end

  def test_gives_feedback_when_correct
    assert_equal "Correct" , @guess.feedback
  end

  def test_gives_feedback_when_incorrect
    guess = Guess.new("10 of Hearts", @incorrect_card)
    assert_equal "Incorrect" , guess.feedback
  end

end
