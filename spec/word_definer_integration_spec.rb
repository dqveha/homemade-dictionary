require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('creates a word to feature on homepage', {:type => :feature}) do
  it('creates a word and then goes to the homepage') do
    visit('/words')
    fill_in('word', :with => 'Peach')
    click_on('Add')
    expect(page).to have_content('Peach')
  end
end

describe('change word', {:type => :feature}) do
  it('changes the word and updates it on the word page') do
    word = Word.new("Peach", nil)
    word.save()
    visit("/words/#{word.id}")
    fill_in('word', :with => 'Nectarine')
    click_on('Change')
    expect(page).to have_content('Nectarine')
  end
end

describe('deletes word', {:type => :feature}) do
  it('deletes the word and goes to the homepage') do
    Word.clear()
    word = Word.new("Peach", nil)
    word.save()
    visit("/words/#{word.id}")
    click_on("Delete word")
    visit('/words')
    expect(page).to have_content('Sorry, we can\'t find any words yet!')
  end
end

describe('creates a definition path', {:type => :feature}) do
  it('creates a definition and then goes to the word page') do
    word = Word.new("Peach", nil)
    word.save()
    visit("/words/#{word.id}")
    fill_in('definition', :with => 'Nectarine without fuzz')
    click_on('Add definition')
    expect(page).to have_content('Nectarine without fuzz')
  end
end

describe('changes definition', {:type => :feature}) do
  it('changes a definition and then goes to the word page') do
    word = Word.new("Peach", nil)
    word.save()
    visit("/words/#{word.id}")
    fill_in('definition', :with => 'Nectarine without fuzz')
    click_on('Add definition')
    click_on('Nectarine without fuzz')
    fill_in('definition', :with => 'Not-as-hard nectarine')
    click_on('Redefine')
    expect(page).to have_content('Not-as-hard nectarine')
  end
end

describe('deletes definition', {:type => :feature}) do
  it('deletes a definition and then goes to the word page') do
    word = Word.new("Peach", nil)
    word.save()
    visit("/words/#{word.id}")
    fill_in('definition', :with => 'Nectarine without fuzz')
    click_on('Add definition')
    click_on('Nectarine without fuzz')
    click_on('Delete definition')
    expect(page).to have_content('There are no definitions yet. Please add one using the form below!')
  end
end