require 'rspec'
require 'word'
require 'pry'

describe '#Word' do

  before(:each) do
    Word.clear()
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
      expect(word1.inserted_word).to(eq("crocodile"))
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
end