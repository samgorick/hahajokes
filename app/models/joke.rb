class Joke < ApplicationRecord
  belongs_to :category

  def category_name=(name)
    self.category = Category.find_or_create_by(name: name)
  end

  def category_name
     self.category ? self.category.name : nil
  end

  def random_gif
    uri = URI.parse("https://api.giphy.com/v1/gifs/random?api_key=ZnyMwXrNuHSmSQcmbcDFmhiSfFbASYSz&tag=#{self.keyword}")
    response = Net::HTTP.get_response(uri)
    body = response.body
    gif = JSON.parse(body)
    link = gif["data"]["images"]["original"]["webp"]
    p link
  end

end

