require_relative 'scraper'
require 'yaml'

# Challenge breakdown

# 1. require open-uri, nokogiri ✅
# 2.0 define method:  `get_top_5_movie_urls` returning an array of URL (String)
  # 2. get TOP 250 url and store in variable
  # 3. make a HTTP request using open-uri (= get raw html file)
  # 4. parse the raw_html with Nokogiri
  # 5. search for the 5 first movie URLs
top_five_url = get_top_5_movie_urls
# 6. iterate over the movie URLs, for each movie URL
# 8. store all hashes in an array
movies_info = top_five_url.map do |movie_url|
  # 7.0 define method: `scrape_movie(movie_url)` returning a hash
    # 7. make a HTTP request using open-uri (= get raw html file)
    # 8. parse the raw_html with Nokogiri
    # 9. search for all the movie infos (in a hash)
  scrape_movie(movie_url)
end

# 9. store the data in a YAML file
yaml_movies = YAML.dump(movies_info)
File.open('movies.yaml', 'wb') do |file|
  file.write(yaml_movies)
end