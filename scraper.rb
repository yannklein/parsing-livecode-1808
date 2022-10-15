# To localize an http request, use:
# "Accept-Language" => "en-US"
require 'nokogiri'
require 'open-uri'

def fetch_movie_urls(url)
  # initialize an empty array
  movie_urls = []
  # get the raw html from the internet
  raw_html = URI.open(url).read
  # parse the raw html with nokogiri
  html_doc = Nokogiri::HTML(raw_html)
  # search for the 5 urls and store them into an array
  html_doc.search(".titleColumn a").first(5).each do |a_tag|
    movie_urls << "https://www.imdb.com" + a_tag.attribute("href").value
  end
  # return the array with 5 links
  p movie_urls
  movie_urls
end

def scrape_movie(url)
  # initialize an empty array
  movie_urls = []
  # get the raw html from the internet
  raw_html = URI.open(url, "Accept-Language" => "en-US").read
  # parse the raw html with nokogiri
  html_doc = Nokogiri::HTML(raw_html)
  # search for the 5 urls and store them into an array
  cast = []
  html_doc.search('.sc-36c36dd0-1.QSQgP').first(3).each do |element|
    cast << element.text.strip
  end
  storyline = html_doc.search('.sc-16ede01-0').text.strip
  director = html_doc.search('.ipc-metadata-list-item__list-content-item')[0].text.strip
  title = html_doc.search('h1').text.strip
  year = html_doc.search('.sc-8c396aa2-2').first.text.strip.to_i
  # return the array with 5 links
  {
    cast: cast,
    storyline: storyline,
    director: director,
    title: title,
    year: year
  }
end