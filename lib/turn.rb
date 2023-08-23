require './lib/card'

class Turn
  attr_reader :string,
              :card

  def initialize(string, card)
    @guess = string
    @card = card
  end

  def guess
    guess
  end

  def card
    card
  end

  def correct?
    guess.eql? card.answer
  end

  def feedback
    if correct?
      puts "Correct!"
    else
      puts "Incorrect."
    end
  end
end