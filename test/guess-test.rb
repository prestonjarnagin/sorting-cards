require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess'

class GuessTest < MiniTest::Test

  def test_it_exists
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_instance_of Guess , guess
  end

  def test_has_card
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_equal card , guess.card
  end

  def test_has_response
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_equal "10 of Hearts" , guess.response
  end

  def test_handles_incorrect_response
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    reftue_equal "9 of Diamonds" , guess.response
  end

  def test_guesses_correctly
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert guess.correct?
  end

  def test_handels_incorrect_guess
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    refute guess.correct?
  end

  def test_gives_feedback_when_correct
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_equal "Correct" , guess.feedback
  end

  def test_gives_feedback_when_incorrect
    card = Card.new("9", "Diamonds")
    guess = Guess.new("10 of Hearts", card)
    assert_equal "Incorrect" , guess.feedback
  end

end
