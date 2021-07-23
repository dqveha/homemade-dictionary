class Word
  attr_reader(:inserted_word, :id)
  attr_accessor 

  @@word_bank = {}
  @@total_rows = 0

  def initialize(inserted_word, id)
    @inserted_word = inserted_word
    @id = id || @@total_rows += 1
  end

  def self.all()
    @@word_bank.values()
  end

  def save()
    @@word_bank[self.id] = Word.new(self.inserted_word, self.id)
  end

  def ==(word_to_compare)
    self.inserted_word() == word_to_compare.inserted_word()
  end

  def self.clear()
    @@word_bank = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@word_bank[id]
  end

  def update(inserted_word)
    @inserted_word = inserted_word
  end
end