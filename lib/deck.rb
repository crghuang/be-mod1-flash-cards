require './lib/card'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    cards.count
  end

  def cards_in_category(category)
    sub_deck = []
    cards.each do |card|
      if card.category == category
        sub_deck << card
      end
    end
    sub_deck
  end
end