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
end