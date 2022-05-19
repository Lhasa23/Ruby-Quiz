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
    @cards.sort!
    self
  end

  def move_joker_a!
    move_card(1, Card.new(value: 53))
    self
  end

  def move_joker_b!
    move_card(2, Card.new(value: 54))
    self
  end

  private

  def move_card(step, card)
    card_index = index_of_card(card)

    if card_index + step + 1 > @cards.size
      @cards.insert(card_index + step + 1 - @cards.size, card)
      @cards.delete_at(card_index + 1)
    else
      @cards.insert(card_index + step + 1, card)
      @cards.delete_at(card_index)
    end
  end

  def index_of_card(card)
    @cards.index { |card_item| card_item.value == card.value }
  end
end
