require_relative 'flashcard.rb'

class Controller
  def initialize(filename)
    @new_deck = Deck.new(filename)
    @cards = @new_deck.cards
  end

  def start_game
    View.welcome
    p @cards[0]
    while @cards[0] != nil
      card = @cards[0]
      View.prompt(card.definition)
      guess = gets.chomp
      if guess == card.word
        View.correct
        card = @cards.shift
      elsif guess != card.word
        View.incorrect
      elsif guess == 'exit'
        View.exit
        break
      end
    end
  end
end

class View

  def self.welcome
    puts "Hey man, let's learn some Ruby."
  end

  def self.prompt(definition)
    puts "Please return the term for this definition: \n #{definition}"
  end

  def self.correct
    puts "Congrats! \n  **********************"
  end

  def self.incorrect
    puts "\n Not quite, but so close. Try again!"
  end

  def self.exit
    puts "Thanks for playing!"
  end

end
