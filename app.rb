require 'sinatra'
require 'sinatra/reloader'
require('./lib/word')
require('./lib/definition')
also_reload 'lib/**/*.rb'
require 'pry'

get('/') do
  @words = Word.all()
  erb(:homemade_dictionary)
end

get('/words') do
  redirect to ('/')
end

get('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @definition = Definition.find(params[:definition_id].to_i())
  erb(:word)
end

post('/words') do
  entered_word = params[:word]
  word = Word.new(entered_word, nil)
  word.save()
  @words = Word.all()
  erb(:homemade_dictionary)
end

post('/words/:id') do
  binding.pry
  definition = Definition.new(params[:definition], @word.id, nil)
  definition.save()
  erb(:word)
end

