# Homemade Dictionary

## [https://github.com/dqveha/homemade-dictionary](https://github.com/dqveha/homemade-dictionary)

#### By Dave Lindqvist

---

## Description

This is the eighth independent project (Ruby, Week 2) assigned by Epicodus to assess my proficiency with Ruby's routing. The purpose of this project was to create a website that routes to different views with create, read, update, and delete (CRUD) functionality. The user can add words, which will pop up in the homepage. The user can click on the word and add definitions. Both words and definitions should all have the capabilities to CRUD as necessary.

## Technologies Used

1. Docker Hub
2. Ruby
3. RSpec & Capybara
4. Sinatra
5. Heroku

## Installation Instructions

1. Open your terminal
2. Clone this repo to your desktop:

```
https://github.com/dqveha/homemade-dictionary.git
```

3. Open the `homemade-dictionary` directory using Visual Studio Code
4. (a) The user can open the webpage through:

```
docker-compose up --build
```
then visit http://localhost:4567/ in the browser

4. (b) or by visiting this website through Heroku

```
https://safe-hamlet-94837.herokuapp.com/
```

## Known Issues:

1. If user submits blank entry, then it will continue to submit with blank words/definitions.
2. Changing a word/definition with a blank entry will show up as an empty bullet.
3. Manually changing the URL to redirect onto different view pages may not work as intended.
4. Please open a pull request if you have any issues!

---

### License is GPLv3 and I make no claim to copyright.
