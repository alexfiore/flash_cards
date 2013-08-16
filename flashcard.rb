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
    read_file
    @cards = []
    generate_cards
  end

  def generate_cards
    @card_hash.each do |definition, word|
      @cards << Card.new(definition, word)
    end
    @cards
  end

  def read_file
    content = File.readlines(@source_file)
    content.reject! {|item| item == "\n"}
    content.map! {|item| item.chomp}
    @card_hash = Hash[*content]
  end

end


# new_deck = Deck.new('flash_cards.txt')
# new_deck.read_file
# new_deck.generate_cards
# p new_deck.cards

