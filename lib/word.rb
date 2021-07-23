class Word
  attr_reader(:word, :id)

  @@word_bank = {}
  @@total_rows = 0

  def initialize(word, id)
    @word = word
    @id = id || @@total_rows += 1
  end

  def self.all()
    @@word_bank.values()
  end

  def save()
    @@word_bank[self.id] = Word.new(self.word, self.id)
  end

  def ==(word_to_compare)
    self.word() == word_to_compare.word()
  end

  def self.clear()
    @@word_bank = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@word_bank[id]
  end

  def update(word)
    @word = word
  end

  def delete()
    @@word_bank.delete(self.id)
  end

  def definitions()
    Definition.find_by_word(self.id)
  end
end