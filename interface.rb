require_relative 'scraper'
require 'yaml'

# Challenge breakdown

# require the gems needed for scraping (open-uri, nokogiri)
# Define get_top_5_movie_urls
  # Fetch the html page using URI.open, store this string in a var
  # Parse the HTML using Nokogiri
  # Search for the links of 5 first movies -> getting an array of strings
movie_urls = get_top_5_movie_urls()
# Iterate of the urls,
movies =  movie_urls.map do |url|
  scrape_movie(url)
end
# For each url,
# Define scrape_movie
  # Fetch the html page using URI.open, store this string in a var
  # Parse the HTML using Nokogiri
  # Search for the title, cast (first 3), directors, storyline, rating, year
  # return hash with each of these data
# Getting an array of hash
p movies
# Dump that data into a YAML file

yaml_movies = YAML.dump(movies)

File.open("movies.yml", "wb") do |file|
  file.write(yaml_movies)
end