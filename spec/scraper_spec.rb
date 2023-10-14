require_relative "../scraper.rb"

the_dark_knight_url = "https://www.imdb.com/title/tt0468569/"

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
#   cast: ["Christian Bale", "Heath Ledger", "Aaron Eckhart"],
#   director: "Christopher Nolan",
#   storyline: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
#   title: "The Dark Knight",
#   year: 2008
# }

describe "#get_top_5_movie_urls" do 
  it "returns an array of 5 movie URLs" do
    expected = ["https://www.imdb.com/title/tt0111161/", "https://www.imdb.com/title/tt0068646/", "https://www.imdb.com/title/tt0468569/", "https://www.imdb.com/title/tt0071562/", "https://www.imdb.com/title/tt0050083/", "https://www.imdb.com/title/tt0108052/"]
    actual = get_top_5_movie_urls
    # puts expected == actual
    expect(actual).to eq(expected)
  end
end

describe "#scrape_movie" do
  it "returns a hashwhich contains all the info for a movie" do 
    expected = {
      cast: ["Christian Bale", "Heath Ledger", "Aaron Eckhart"],
      director: "Christopher Nolan",
      storyline: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
      title: "The Dark Knight",
      year: 2008,
      rating: "9.0/10"
    }
    actual = scrape_movie(the_dark_knight_url)
    expect(actual).to eq(expected)
  end
end