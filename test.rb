require 'open-uri'
require 'nokogiri'

url = 'https://www.imdb.com/title/tt0468569/'
html_content = URI.open(url, 'Accept-Language' => 'en-US').read
doc = Nokogiri::HTML(html_content)

