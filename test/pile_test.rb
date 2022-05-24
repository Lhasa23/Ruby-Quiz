require 'minitest/autorun'
require '../src/pile'
require '../src/card'

class PileTest < Minitest::Test
  def test_pile_generate_cards
    pile = Pile.new
    assert_equal 54, pile.card_size
    assert_equal Card, pile.cards.first.class
  end

  def test_pile_has_4_suits_of_card
    card_suits = Pile.new.card_suits
    assert_equal 4, card_suits.size
    assert_equal card_suits.sort, Card::SUITS.sort

    assert_equal Pile.new([Card.new(1)]).card_suits, [Card::CLUB]
  end

  def test_pile_card_value_from_1_to_54
    assert_equal (1..54).to_a, Pile.new.order!.card_values
  end

  def test_disordered_pile_order
    cards = [Card.new(3), Card.new(1), Card.new(10), Card.new(8)]
    assert_equal Pile.new(cards).order!.card_values, [1, 3, 8, 10]
  end

  def test_move_joker_a_to_next_1_card
    cards = [Card.new(13), Card.new(54), Card.new(53), Card.new(8), Card.new(24)]
    assert_equal [13, 54, 8, 53, 24], Pile.new(cards).move_joker_a!.card_values
  end

  def test_move_joker_a_to_next_1_card_in_limited
    cards = [Card.new(13), Card.new(54), Card.new(12), Card.new(8), Card.new(53)]
    assert_equal [13, 53, 54, 12, 8], Pile.new(cards).move_joker_a!.card_values
  end

  def test_move_joker_b_to_next_2_card
    cards = [Card.new(13), Card.new(54), Card.new(53), Card.new(8), Card.new(24)]
    assert_equal [13, 53, 8, 54, 24], Pile.new(cards).move_joker_b!.card_values
  end

  def test_move_joker_b_to_next_2_card_in_limited
    cards = [Card.new(13), Card.new(12), Card.new(53), Card.new(54), Card.new(24)]
    assert_equal [13, 54, 12, 53, 24], Pile.new(cards).move_joker_b!.card_values
    cards = [Card.new(13), Card.new(12), Card.new(53), Card.new(24), Card.new(54)]
    assert_equal [13, 12, 54, 53, 24], Pile.new(cards).move_joker_b!.card_values
  end

  def test_triple_cut
    cards = [Card.new(2), Card.new(53), Card.new(3), Card.new(4), Card.new(54)]
    assert_equal [53, 3, 4, 54, 2], Pile.new(cards).triple_cut!.card_values
    cards = [Card.new(2), Card.new(53), Card.new(3), Card.new(4), Card.new(54), Card.new(8)]
    assert_equal [8, 53, 3, 4, 54, 2], Pile.new(cards).triple_cut!.card_values
  end

  def test_count_cut
    cards = [Card.new(8), Card.new(53), Card.new(3), Card.new(4), Card.new(54), Card.new(2)]
    assert_equal [3, 4, 54, 8, 53, 2], Pile.new(cards).count_cut!.card_values
  end
  
  def test_read_card_value
    cards = [Card.new(2), Card.new(3), Card.new(8)]
    assert_equal 'H', Pile.new(cards).read_card
  end
end
