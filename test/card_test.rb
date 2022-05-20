require 'minitest/autorun'
require '../src/card'

class CardTest < Minitest::Test
  def test_initialize_card_by_value
    card = Card.new(13)

    assert_equal Card::CLUB, card.suit
    assert_equal 13, card.number

    card = Card.new(37)

    assert_equal Card::HEART, card.suit
    assert_equal 11, card.number
  end

  def test_card_value
    assert_equal 1, Card.new(1).value
  end

  def test_card_sort_by_value
    assert_equal [1, 3], [Card.new(3), Card.new(1)].sort.map(&:value)
  end
end
