require_relative 'card'

class Pile
  attr_reader :cards

  def initialize(cards = nil)
    if cards.nil?
      @cards = (1..54).to_a.shuffle.map { |value| Card.new(value: value) }
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

  def order!
    @cards.sort_by!(&:value)
    self
  end
end
