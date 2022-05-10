require 'minitest/autorun'
require '../src/pile'

class PileTest < Minitest::Test
  # Pile
  #   cards
  #   order!
  #   move_joker_a
  def test_pile_generate_cards
    assert_equal 54, Pile.new.card_size
  end

  def test_pile_has_4_suits_of_card
    skip
    assert_equal 4, Pile.new.card_suits.size
  end
end
