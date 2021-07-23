require 'rspec'
require 'word'
require 'definition'
require 'pry'

describe('#Definition') do

  describe('.all') do
    it("returns an empty array when there are no definitions") do
      expect(Definition.all()).to(eq([]))
    end
  end

  describe('#==') do
    it("is the same definition if it has the same attributes as another definition") do
      definition1 = Definition.new("large, green reptile", @word_id, nil)
      definition2 = Definition.new("large, green reptile", @word_id, nil)
      expect(definition1).to(eq(definition2))
    end
  end

  describe('#save') do
    it("saves a definition and will be listed within Definition class variable") do
      definition1 = Definition.new("large, green reptile", @word_id, nil)
      definition1.save()
      definition2 = Definition.new("large, green reptile", @word_id, nil)
      definition2.save()
      expect(Definition.all()).to(eq([definition1, definition2]))
    end
  end

end