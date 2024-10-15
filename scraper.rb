require 'nokogiri'
require 'open-uri'

# Build get_top_5_movie_urls
def get_top_5_movie_urls
  url = "https://www.imdb.com/chart/top/"
  # Fetch the html page using URI.open, store this string in a var
  html = URI.open(url, 'Accept-Language' => 'en', "User-Agent" => "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:89.0) Gecko/20100101 Firefox/89.0").read
  # Parse the HTML using Nokogiri
  doc = Nokogiri::HTML.parse(html)
  # Search for the links of 5 first movies -> getting an array of strings
  movie_urls = []
  doc.search(".ipc-title-link-wrapper").first(5).each do |movie_card|
    movie_urls << "https://www.imdb.com#{ movie_card.attribute("href").value.split("?")[0] }"
  end
  movie_urls
end

# Build scrape_movie
def scrape_movie(url)
  html_content = URI.open(url, 'Accept-Language' => 'en', "User-Agent" => "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:89.0) Gecko/20100101 Firefox/89.0").read
  doc = Nokogiri::HTML(html_content)

  return {
    title: doc.search('.hero__primary-text').text.strip,
    year: doc.search('/html/body/div[2]/main/div/section[1]/section/div[3]/section/section/div[2]/div[1]/ul/li[1]/a').text.strip.to_i,
    storyline: doc.search(".sc-55855a9b-0.dAbouZ").text.strip,
    director: doc.search(".ipc-metadata-list-item__list-content-item.ipc-metadata-list-item__list-content-item--link")[0].text.strip,
    cast: doc.search('.sc-cd7dc4b7-1').first(3).map { |el| el.text.strip },
    rating: doc.search('.sc-d541859f-2.kxphVf')[0].text.strip
  }
end