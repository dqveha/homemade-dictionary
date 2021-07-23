require 'rspec'
require 'word'
require 'definition'
require 'pry'

describe('#Definition') do

  before(:each) do
    Word.clear()
    Definition.clear()
    @word = Word.new("Nectarine", nil)
    @word.save()
  end

  describe('.all') do
    it("returns an empty array when there are no definitions") do
      expect(Definition.all()).to(eq([]))
    end
  end

  describe('#==') do
    it("is the same definition if it has the same attributes as another definition") do
      definition1 = Definition.new("large, green reptile", @inserted_word_id, nil)
      definition2 = Definition.new("large, green reptile", @inserted_word_id, nil)
      expect(definition1).to(eq(definition2))
    end
  end

  describe('#save') do
    it("saves a definition and will be listed within Definition class variable") do
      definition1 = Definition.new("large, green reptile", @inserted_word_id, nil)
      definition1.save()
      definition2 = Definition.new("large, green reptile", @inserted_word_id, nil)
      definition2.save()
      expect(Definition.all()).to(eq([definition1, definition2]))
    end
  end

  describe('.clear') do
    it("clears all definitions") do
      definition1 = Definition.new("peach without fuzz", @inserted_word_id, nil)
      definition1.save()
      definition2 = Definition.new("nectarine with fuzz", @inserted_word_id, nil)
      definition2.save()
      Definition.clear()
      expect(Definition.all()).to(eq([]))
    end
  end

  describe('.find') do
    it("finds a definition by id") do
      definition1 = Definition.new("peach without fuzz", @inserted_word_id, nil)
      definition1.save()
      expect(Definition.find(definition1.id)).to(eq(definition1))
    end
  end

  describe('#update') do
    it("updates a definition by its word id") do
      definition1 = Definition.new("peach without fuzz", @inserted_word_id, nil)
      definition1.save()
      definition1.update("nectarine with fuzz", @inserted_word_id)
      expect(definition1.inserted_definition).to(eq("nectarine with fuzz"))
    end
  end

end