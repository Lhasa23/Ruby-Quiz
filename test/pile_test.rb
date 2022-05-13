require 'minitest/autorun'
require '../src/pile'
require '../src/card'

class PileTest < Minitest::Test
  # Pile
  #   4 kinds of suit
  #   include card value from 1 to 52
  #   include two 53 of card value
  #   order!
  #     card value from 1 to 52 and joker-a and joker-b card
  #   move_joker_a
  #     determined joker-a card
  #     move joker-a card to next 1 card
  def test_pile_generate_cards
    pile = Pile.new
    assert_equal 52, pile.card_size
    assert_equal Card, pile.cards.first.class
  end

  def test_pile_has_4_suits_of_card
    card_suits = Pile.new.card_suits
    assert_equal 4, card_suits.size
    assert_equal card_suits.sort, Card::SUITS.sort

    assert_equal Pile.new([Card.new(value: 1)]).card_suits, [Card::CLUB]
  end

  def test_pile_card_value_from_1_to_52
    assert_equal (1..52).to_a, Pile.new.card_values
  end
end
