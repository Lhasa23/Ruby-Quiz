require_relative 'card'

class Pile
  attr_reader :cards

  def initialize(cards = nil)
    if cards.nil?
      @cards = Array.new(52) { |index| Card.new(index % 13 + 1, Card::SUITS[index / 13]) }
    else
      @cards = cards
    end
  end

  def card_size
    @cards.size
  end

  def card_suits
    @cards.group_by(&:suit).keys & Card::SUITS
  end
end
