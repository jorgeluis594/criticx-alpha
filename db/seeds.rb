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
  companies = game["involved_companies"]
  platforms = Platform.where(name: game["platforms"].map {|platform| platform["name"]}) rescue nil
  data_game = game.slice("name", "summary", "release_date", "category", "rating")
  data_game[:parent] = Game.where(name: game["parent"])[0] if game["category"] == 1
  if game["rating"].is_a?(Integer)
    game = Game.create!(data_game)
    genres.each { |genre| game.genres << genre }
    companies.each {|company| InvolvedCompany.create!(company: Company.where(name: company["name"])[0], game: game, developer: company["developer"], publisher: company["publisher"]) }
    if platforms && !platforms.empty?
     platforms.each {|platform| game.platforms << platform}
    end
  end
end