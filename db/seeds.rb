# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"

Bookmark.delete_all
puts "deleting bookmarks"

Movie.delete_all
puts "deleting movies"

List.delete_all
puts "deleting lists"

Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)
Movie.create(title: "The Hobbit, an unexpeted journey", overview: "A well mannered Hobbit named Bilbo Baggins, embarks upon a journey to take back a kingdom, and a very important jewel ,with twelve dwarves, and a wizard.", poster_url: "https://i.pinimg.com/474x/83/c6/2a/83c62a6fc2bd8c1977f9850d8d75e48c.jpg", rating: 8.9)

puts "#{Movie.count} movies created"

file = URI.parse("https://i.pinimg.com/736x/b6/dd/34/b6dd34b9a46b018cf715e943d8891988.jpg").open
list = List.new(name: "Fantasy")
list.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
list.save