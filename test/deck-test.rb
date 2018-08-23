require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'

class DeckTest < MiniTest::Test

  def setup
    @card_1 = Card.new("3","Hearts")
    @card_2 = Card.new("4", "Clubs")
    @card_3 = Card.new("5", "Diamonds")
    @deck = Deck.new([@card_1, @card_2, @card_3])
  end
  def test_it_exists
    assert_instance_of Deck , @deck
  end

  def test_it_has_cards
    assert_equal [@card_1, @card_2, @card_3] , @deck.cards
  end

  def test_it_can_count
    assert_equal 3 , @deck.count
    card_4 = Card.new("5", "Diamonds")
    @deck.cards << card_4
    assert_equal 4 , @deck.count
  end

  def test_it_can_sort
    card_1 = Card.new("4","Hearts")
    card_2 = Card.new("Jack", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    card_4 = Card.new("Ace", "Spades")
    card_5 = Card.new("Ace", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3, card_4, card_5])
    assert_equal [card_1, card_3, card_2, card_5, card_4] , deck.sort
  end

  def test_it_can_sort_something_else
    card_1 = Card.new("7","Hearts")
    card_2 = Card.new("7", "Clubs")
    card_3 = Card.new("10", "Diamonds")
    card_4 = Card.new("2", "Spades")
    card_5 = Card.new("4", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3, card_4, card_5])
    assert_equal [card_4, card_5, card_2, card_1, card_3] , deck.sort
  end

  def test_can_sort_one_card
    deck = [@card_1]
    assert_equal [@card_1] , deck.sort
  end

  def test_can_merge_sort
    card_1 = Card.new("7","Hearts")
    card_2 = Card.new("7", "Clubs")
    card_3 = Card.new("10", "Diamonds")
    card_4 = Card.new("2", "Spades")
    card_5 = Card.new("4", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3, card_4, card_5])
    assert_equal [card_4, card_5, card_2, card_1, card_3] , deck.merge_sort

    card_1 = Card.new("4","Hearts")
    card_2 = Card.new("Jack", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    card_4 = Card.new("Ace", "Spades")
    card_5 = Card.new("Ace", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3, card_4, card_5])
    assert_equal [card_1, card_3, card_2, card_5, card_4] , deck.sort
  end

end
