class Definition
  attr_reader
  attr_accessor

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

end