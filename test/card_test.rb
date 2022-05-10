require 'minitest/autorun'
require '../src/card'

class CardTest < Minitest::Test
  def test_generate_card_with_suit_and_number
    card = Card.new(1, 'Club')

    assert_equal 'Club', card.suit
    assert_equal 1, card.number
  end

  def test_card_value
    assert_equal 1, Card.new(1, Card::CLUB).value
    assert_equal 14, Card.new(1, Card::DIAMOND).value
    assert_equal 27, Card.new(1, Card::HEART).value
    assert_equal 40, Card.new(1, Card::SPADE).value
  end
end
