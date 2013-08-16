class Card

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

  def generate_cards
    @card_hash.each do |definition, word|
      @cards << Card.new(definition, word)
    end
    @cards
  end

  def read_file
    array = File.readlines(@source_file)
    array.reject! {|item| item == "\n"}
    array.map! {|item| item.chomp}
    @card_hash = Hash[*array]
  end




end


new_deck = Deck.new('flash_cards.txt')
new_deck.read_file
new_deck.generate_cards
p new_deck.cards[0].definition

# new_deck.cards #return array of deck

# (Object of the card).definition #return definition of that specific card
# (Object of the card).word

