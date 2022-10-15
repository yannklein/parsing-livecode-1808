require_relative 'scraper'

# Challenge breakdown

# 1. get url from website
url = "https://www.imdb.com/chart/top"
# 2. scrape the link of the first 5 movies (use inspector to figure out what we want)
# 3. store 5 links into array
#  => fetch_movie_urls
links = fetch_movie_urls(url)
# 4. iterate over the links array, for each link
movies = []

links.each do |link|
  # 5. scrape the info from each movie => hash
  #  => scrape_movie
  movie = scrape_movie(link)
  movies << movie
end
# 6. dump an array of hashes the info into a yaml file
movies_serialized = movies.to_yaml
File.open("movies.yml", "wb") do |file|
  File.write(movies_serialized)
end