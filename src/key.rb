require_relative 'pile'
class Key
  def initialize(pile)
    @pile = pile
  end

  def generate(length)
    (1..length).map do |index|
      @pile.move_joker_a!
      @pile.move_joker_b!
      @pile.triple_cut!
      @pile.count_cut!
      @pile.read_card

    end.join
  end
end
