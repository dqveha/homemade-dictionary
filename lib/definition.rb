class Definition
  attr_reader(:id)
  attr_accessor(:inserted_definition, :inserted_word_id)

  @@definitions = {}
  @@total_rows = 0

  def initialize(insert_definition, inserted_word_id, id)
    @insert_definition = insert_definition
    @inserted_word_id = inserted_word_id
    @id = id || @@total_rows += 1
  end

  def self.all()
    @@definitions.values()
  end
  
  def save
    @@definitions[self.id] = Definition.new(self.inserted_definition, self.inserted_word_id, self.id)
  end

  def ==(definition_to_compare)
    (self.inserted_definition() == definition_to_compare.inserted_definition()) && (self.inserted_word_id() === definition_to_compare.inserted_word_id())
  end

  def self.clear()
    return
  end
end