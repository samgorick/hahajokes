class Joke < ApplicationRecord
  belongs_to :category
  validates_presence_of :lead_up, :punchline, :funniness, :category_id

  def category_name=(name)
    self.category = Category.find_or_create_by(name: name)
  end

  def category_name
     self.category ? self.category.name : nil
  end

  def random_gif
    uri = URI.parse("https://api.giphy.com/v1/gifs/random?api_key=ZnyMwXrNuHSmSQcmbcDFmhiSfFbASYSz&tag=#{search_term}")
    response = Net::HTTP.get_response(uri)
    body = response.body
    gif = JSON.parse(body)
    link = gif["data"]["images"]["original"]["webp"]
    p link
  end

  def search_term
    text = self.lead_up
    tgr = EngTagger.new
    nouns = tgr.get_words(text)
    sort = nouns.sort_by { |k,v| k.length }.reverse
    search_term = sort[0][0].downcase
    p "*" * 75
    p search_term
  end

end

