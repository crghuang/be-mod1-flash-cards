require './lib/card'
require './lib/turn'
require './lib/deck'

class Round
  attr_reader :deck,
              :turns,
              :current_card

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = deck.cards.shift # Remove first element, return it
  end

  def take_turn(guess)
    @turns << Turn.new(guess, @current_card)
    @current_card = @deck.cards.shift
    @turns.last
  end

  def correct_turns
    correct = []
    @turns.each do |turn|
      if turn.correct?
        correct << turn
      end
    end
    correct
  end

  def number_correct
    correct_turns.count
    # number_correct = 0
    # @turns.each do |turn|
    #   if turn.correct?
    #     number_correct += 1
    #   end
    # end
    # number_correct
  end

  def turns_by_category(category)
    count = 0
    @turns.each do |turn|
      if turn.card.category == category
        count += 1
      end
    end
    count 
  end

  def number_correct_by_category(category)
    count = 0
    correct_turns.each do |turn|
      if turn.card.category == category
        count += 1
      end
    end
    count
  end

  def percent_correct
    denom = @turns.count
    if denom != 0
      number_correct.to_r / denom.to_r * 100
    else
      0
    end
  end

  def percent_correct_by_category(category)
    denom = turns_by_category(category)
    if denom != 0
      number_correct_by_category(category).to_r / denom.to_r * 100
    else
      0
    end
  end
end