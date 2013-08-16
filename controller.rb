
class Controller
  def initialize(filename)
    @new_deck = Deck.new(filename)
    @cards = new_deck.cards
    # @cards = [Card.new('fuck', 'fuck'), Card.new('shit', 'shit')]
  end

  def start_game
    View.welcome
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

# class Card
#   attr_reader :definition, :word
#   def initialize(definition, word)
#     @definition = definition
#     @word = word
#   end
# end

class View 

  def welcome 
    puts "Hey man, let's learn some Ruby."
  end

  def prompt(definition)
    puts "Please return the term for this definition: \n #{definition}"
  end

  def correct
    puts "Congrats! \n  **********************"
  end

  def incorrect 
    puts "\n Not quite, but so close. Try again!"
  end

  def exit 
    puts "Thanks for playing!"
  end

end
