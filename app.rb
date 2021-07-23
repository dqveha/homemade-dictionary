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

get('/words/new') do
  erb(:new_word)
end

post('/words') do
  entered_word = params[:word]
  word = Word.new(entered_word, nil)
  word.save()
  @words = Word.all()
  erb(:homemade_dictionary)
end