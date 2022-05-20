require_relative 'card'

class Pile
  def initialize(cards = nil)
    @cards = cards
  end

  def cards
    @cards ||= (1..54).to_a.shuffle.map { |value| Card.new(value) }
  end

  def card_size
    cards.size
  end

  def card_suits
    cards.group_by(&:suit).keys & Card::SUITS
  end

  def card_values
    cards.map(&:value)
  end

  def order!
    cards.sort!
    self
  end

  def move_joker_a!
    move_card(1, Card.new(53))
    self
  end

  def move_joker_b!
    move_card(2, Card.new(54))
    self
  end

  def triple_cut!
    top_joker_index, bottom_joker_index = triple_cut_indexes

    top = cards.slice(0...top_joker_index)
    bottom = cards.slice((bottom_joker_index + 1)..-1)
    between = cards.slice(top_joker_index..bottom_joker_index)
    @cards = [*bottom, *between, *top]
    self
  end

  def count_cut!
    count = cards.last.value
    top = cards.slice!(0, count)
    cards.concat(top)
    self
  end

  private

  def triple_cut_indexes
    joker_a_card_index = index_of_card(Card.new(53))
    joker_b_card_index = index_of_card(Card.new(54))

    return [joker_a_card_index, joker_b_card_index] if joker_a_card_index < joker_b_card_index

    [joker_b_card_index, joker_a_card_index]
  end

  def move_card(step, card)
    card_index = index_of_card(card)

    if card_index + step + 1 > cards.size
      cards.insert(card_index + step + 1 - cards.size, card)
      cards.delete_at(card_index + 1)
    else
      cards.insert(card_index + step + 1, card)
      cards.delete_at(card_index)
    end
  end

  def index_of_card(card)
    cards.index { |card_item| card_item.value == card.value }
  end
end
