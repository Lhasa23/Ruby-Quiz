require 'minitest/autorun'
require '../src/key'

class KeyTest < Minitest::Test
  # Happy Path:
  # move JokerA to next 1 card
  # move JokerB to next 2 cards(cycle)
  # cards before first Joker from top exchange with cards behind second Joker from top
  # move some cards size equals value of deck card from top to pile bottom
  # count cards size(include top card) equals value of top card
  # read value of current card
  #
  # Order Pile: A-K Club A-K Diamond A-K Heart A-K Spade JokerA JokerB
  # generate 10 characters
  # D W J X H Y R F D G
  def test_generate_key
    # assert_equal 'DW', Key.new(Pile.new.order!).generate(2)
    assert_equal 'DWJXHYRFDG', Key.new(Pile.new.order!).generate(10)
  end
end
