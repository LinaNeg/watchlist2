require "open-uri"
require "json"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# https://image.tmdb.org/t/p/w200 + poster_path

response = URI.open("http://tmdb.lewagon.com/movie/top_rated").read
movies = JSON.parse(response)["results"]
movies.each do |movie|
  Movie.create(title: movie["title"],
               overview: movie["overview"],
               poster_url: "https://image.tmdb.org/t/p/w200#{movie['poster_path']}",
               rating: movie["vote_average"].round)
end
