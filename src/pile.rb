require_relative 'card'

class Pile
  attr_reader :cards

  def initialize(cards = nil)
    if cards.nil?
      @cards = Array.new(52) { |index| Card.new(value: index + 1) }
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

  def card_values
    @cards.map(&:value)
  end
end
