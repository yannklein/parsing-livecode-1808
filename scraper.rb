# To localize an http request, use:
# "Accept-Language" => "en-US"

require 'nokogiri'
require 'open-uri'

# Build get_top_5_movie_urls
def get_top_5_movie_urls
  # 2. get TOP 250 url and store in variable
  imdb_url = "https://www.imdb.com/chart/top"
  # 3. make a HTTP request using open-uri (= get raw html file)
  # html_file = URI.open(imdb_url).read
  html_file = File.open("movie.html").read
  # 4. parse the raw html with Nokogiri
  html_doc = Nokogiri::HTML.parse(html_file)
  # 5. search for the 5 first movie URLs
  css_selector = ".ipc-metadata-list-summary-item .ipc-title-link-wrapper"
  a_tags = html_doc.search(css_selector) #this is an array of <a> tag
  movie_urls = a_tags.map do |a_tag|
    # p a_tag
    parial_url = a_tag.attribute("href").value
    "https://www.imdb.com#{parial_url.split("?")[0]}"
  end
  movie_urls[0..5]
end
# Build scrape_movie
def scrape_movie(url)
  # 7. make a HTTP request using open-uri (= get raw html file)
  html_content = URI.open(url, 'Accept-Language' => 'en', "User-Agent" => "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:89.0) Gecko/20100101 Firefox/89.0").read
  # 8. parse the raw_html with Nokogiri
  doc = Nokogiri::HTML.parse(html_content)
  # 9. search for all the movie infos (in a hash)
  title = doc.search('.sc-afe43def-1.fDTGTb').text.strip
  year = doc.search('.sc-e226b0e3-3 .ipc-link.ipc-link--baseAlt.ipc-link--inherit-color').text.strip[0..3].to_i
  synopsis = doc.search(".sc-466bb6c-0.kJJttH").text.strip
  director = doc.search('.ipc-metadata-list-item__list-content-item.ipc-metadata-list-item__list-content-item--link').first.text.strip
  cast = doc.search('a.sc-bfec09a1-1.fUguci')[0...3].map { |element| element.text.strip }
  rating = doc.search(".sc-bde20123-2.gYgHoj")[0].text.strip

  return {
    title: title,
    year: year,
    storyline: synopsis,
    director: director,
    cast: cast,
    rating: rating
  }
end