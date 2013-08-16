class Cards

  attr_reader :definition, :word

  def initialize(definition, word)
    @definition = definition
    @word = word
  end
end

class Deck

  attr_reader :cards

  def initialize(source_file)
    @source_file = source_file
    @cards = []
  end

  def read_file
    File.readlines(@source_file) do |row|
      p row
    end
  end




end


new_deck = Deck.new('flashcard_samples.txt')

new_deck.read_file

# new_deck.cards #return array of deck

# (Object of the card).definition #return definition of that specific card
# (Object of the card).word

