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

get('/words/:id/definitions/:definition_id') do
  @word = Word.find(params[:id].to_i())
  @definition = Definition.find(params[:definition_id].to_i())
  erb(:definition)
end

post('/words') do
  word = Word.new(params[:word], nil)
  word.save()
  @words = Word.all()
  erb(:homemade_dictionary)
end

post('/words/:id/definitions/')do
  @word = Word.find(params[:id].to_i())
  a_definition = Definition.new(params[:definition], @word.id, nil)
  a_definition.save()
  erb(:word)
end

patch('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.update(params[:word])
  @words = Word.all()
  erb(:word)
end

patch('/words/:id/definitions/:definition_id') do
  @word = Word.find(params[:id].to_i())
  a_definition = Definition.find(params[:definition_id].to_i())
  a_definition.update(params[:definition].to_s, @word.id)
  erb(:word)
end

delete('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.delete()
  @words = Word.all()
  erb(:homemade_dictionary)
end

delete('/words/:id/definitions/:definition_id') do
  a_definition = Definition.find(params[:definition_id].to_i())
  a_definition.delete
  @word = Word.find(params[:id].to_i())
  erb(:word)
end