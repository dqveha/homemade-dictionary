require 'rspec'
require 'word'
require 'definition'
require 'pry'

describe '#Word' do

  before(:each) do
    Word.clear()
    Definition.clear()
  end

  describe('.all') do
    it("returns an empty array when there are no words") do
      expect(Word.all()).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a word within class variable") do
      word1 = Word.new("alligator", nil)
      word1.save()
      word2 = Word.new("crocodile", nil)
      word2.save()
      expect(Word.all()).to(eq([word1, word2]))
    end
  end

  describe('.clear') do
    it("clears all the words within class variable") do
      word1 = Word.new("alligator", nil)
      word1.save()
      word2 = Word.new("crocodile", nil)
      word2.save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

  describe('.find') do
    it("finds a word by id") do
      word1 = Word.new("alligator", nil)
      word1.save()
      word2 = Word.new("crocodile", nil)
      word2.save()
      expect(Word.find(word1.id)).to(eq(word1))
      expect(Word.find(word2.id)).to(eq(word2))
    end
  end

  describe('#update') do
    it("updates the word in case of fixing spelling") do
      word1 = Word.new("alligator", nil)
      word1.save()
      word1.update("crocodile")
      expect(word1.word).to(eq("crocodile"))
    end
  end

  describe('#delete') do
    it("deletes the word from class variable") do
      word1 = Word.new("alligator", nil)
      word1.save()
      word2 = Word.new("crocodile", nil)
      word2.save()
      word1.delete()
      expect(Word.all()).to(eq([word2]))
    end
  end

  describe('#definition') do
    it("returns a word's definition(s)") do
      word = Word.new("Peach", nil)
      word.save()
      word2 = Word.new("Nectarine", nil)
      word2.save()
      definition1 = Definition.new("Nectarine with fuzz", word.id, nil)
      definition1.save()
      definition2 = Definition.new("Softer nectarine", word.id, nil)
      definition2.save()
      expect(word.definitions()).to(eq([definition1, definition2]))
      expect(word2.definitions()).to(eq([]))
    end
  end
end