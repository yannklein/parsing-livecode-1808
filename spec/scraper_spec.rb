require_relative "../scraper.rb"

# data for #get_top_5_movie_urls:
# [
#   "https://www.imdb.com/title/tt0111161/",
#   "https://www.imdb.com/title/tt0068646/",
#   "https://www.imdb.com/title/tt0071562/",
#   "https://www.imdb.com/title/tt0468569/",
#   "https://www.imdb.com/title/tt0050083/"
# ]

# data for #scrape_movie:
# {
# 
#'
#   cast: ["Christian Bale", "Heath Ledger", "Aaron Eckhart"],
#   director: "Christopher Nolan",
#   storyline: "When a menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman, James Gordon and Harvey Dent must work together to put an end to the madness.",
#   title: "The Dark Knight",
#   year: 2008,
#   rating: "9.0/10"
# }

describe '#get_top_5_movie_urls' do
  it "returns an array of 5 movie URLS" do
    expected = ["https://www.imdb.com/title/tt0111161/", "https://www.imdb.com/title/tt0068646/", "https://www.imdb.com/title/tt0468569/", "https://www.imdb.com/title/tt0071562/", "https://www.imdb.com/title/tt0050083/"]
    actual = get_top_5_movie_urls()
    expect(actual).to eq(expected)
  end
end

the_dark_knight_url = "https://www.imdb.com/title/tt0468569/"

describe '#scrape_movie' do
  it "returns a hash containing all the movie info" do
    expected = {
      cast: ["Christian Bale", "Heath Ledger", "Aaron Eckhart"],
      director: "Christopher Nolan",
      storyline: "When a menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman, James Gordon and Harvey Dent must work together to put an end to the madness.",
      title: "The Dark Knight",
      year: 2008,
      rating: "9.0/10"
    }
    actual = scrape_movie(the_dark_knight_url)
    expect(actual).to eq(expected)
  end
end