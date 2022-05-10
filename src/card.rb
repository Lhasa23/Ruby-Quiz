class Card
  CLUB = 'Club'.freeze
  DIAMOND = 'Diamond'.freeze
  HEART = 'Heart'.freeze
  SPADE = 'Spade'.freeze
  SUITS = [CLUB, DIAMOND, HEART, SPADE].freeze

  attr_reader :suit, :number

  def initialize(number, suit)
    @suit = suit
    @number = number
  end

  def value
    SUITS.index(@suit) * 13 + @number
  end
end
