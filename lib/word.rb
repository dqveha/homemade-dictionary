class Word
  attr_reader 
  attr_accessor 

  @@word_bank = {}
  @@total_rows = 0

  def initialize(word, id)
    @word = word
    @id = id || @@total_rows += 1
  end

  def self.all
    return
  end

end