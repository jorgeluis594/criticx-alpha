require 'json'

def load_data (path)
  JSON.parse(File.read(path))
end

company = load_data('db/companies.json')
company.each { |company| Company.create!(company) }

genres = load_data("db/genres.json")["genres"]
genres.each { |genre| Genre.create!(name: genre) }

platforms = load_data("db/platforms.json")
platforms.each { |platform| Platform.create!(platform) }

games = load_data("db/games.json")
games.each do |game|
  genres = Genre.where(name: game["genres"]) # Genre that match the names
  game = Game.create!(game.slice("name", "summary", "release_date", "category", "rating"))
  genres.each { |genre| game.genres << genre }
end