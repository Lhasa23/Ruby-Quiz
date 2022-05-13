class Card
  CLUB = 'Club'.freeze
  DIAMOND = 'Diamond'.freeze
  HEART = 'Heart'.freeze
  SPADE = 'Spade'.freeze
  JOKER_A = 'Joker_a'.freeze
  JOKER_B = 'Joker_b'.freeze
  SUITS = [CLUB, DIAMOND, HEART, SPADE].freeze

  def initialize(value: 0)
    @value = value
  end

  def value
    @value
  end

  def suit
    SUITS[(@value - 1) / 13]
  end

  def number
    (@value - 1) % 13 + 1
  end
end
