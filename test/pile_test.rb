require 'minitest/autorun'
require '../src/pile'
require '../src/card'

class PileTest < Minitest::Test
  # Pile
  def test_pile_generate_cards
    pile = Pile.new
    assert_equal 54, pile.card_size
    assert_equal Card, pile.cards.first.class
  end

  def test_pile_has_4_suits_of_card
    card_suits = Pile.new.card_suits
    assert_equal 4, card_suits.size
    assert_equal card_suits.sort, Card::SUITS.sort

    assert_equal Pile.new([Card.new(value: 1)]).card_suits, [Card::CLUB]
  end

  def test_pile_card_value_from_1_to_54
    assert_equal (1..54).to_a, Pile.new.order!.card_values
  end

  def test_disordered_pile_order
    cards_a = (1..13).to_a.shuffle.map { |i| Card.new(value: i) }
    assert_equal Pile.new(cards_a).order!.card_values, (1..13).to_a
  end

  #   move_joker_a
  #     determined joker-a card
  #     move joker-a card to next 1 card


end
