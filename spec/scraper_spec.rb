require_relative "../scraper.rb"

imdb_url = "https://www.imdb.com/chart/top"

# data for #fetch_movies_url:
# [
#   "https://www.imdb.com/title/tt0111161/",
#   "https://www.imdb.com/title/tt0068646/",
#   "https://www.imdb.com/title/tt0071562/",
#   "https://www.imdb.com/title/tt0468569/",
#   "https://www.imdb.com/title/tt0050083/"
# ]

describe "#fetch_movie_urls" do
  it "return an array of 5 movies" do
    expected = [
      "https://www.imdb.com/title/tt0111161/",
      "https://www.imdb.com/title/tt0068646/",
      "https://www.imdb.com/title/tt0468569/",
      "https://www.imdb.com/title/tt0071562/",
      "https://www.imdb.com/title/tt0050083/"
    ]
    actual = fetch_movie_urls(imdb_url)
    expect(actual).to eq(expected)
  end
end

# data for #scrape_movie:
#
# link to scrape: "https://www.imdb.com/title/tt0468569/"
#
# {
#   cast: [ "Christian Bale", "Heath Ledger", "Aaron Eckhart" ],
#   director: "Christopher Nolan",
#   storyline: "When the menace known as the Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham. The Dark Knight must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
#   title: "The Dark Knight",
#   year: 2008
# }
describe "#scrape_movie" do
  it "return a hash with the right movie info" do
    expected = {
      cast: [ "Christian Bale", "Heath Ledger", "Aaron Eckhart" ],
      director: "Christopher Nolan",
      storyline: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
      title: "The Dark Knight",
      year: 2008
    }
    actual = scrape_movie("https://www.imdb.com/title/tt0468569/")
    expect(actual).to eq(expected)
  end
end


movie_url = "https://www.imdb.com/title/tt0468569/"

