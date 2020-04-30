class JokesController < ApplicationController

  def new 
    @joke = Joke.new
  end

  def create
    @joke = Joke.create!(joke_params)
    redirect_to joke_path(@joke)
  end

  def show
    @joke = Joke.find(params[:id])
  end

  def index
    @jokes = Joke.all
  end

  private

  def joke_params
    params.require(:joke).permit(:lead_up, :punchline, :keyword, :funniness, :claire_laugh, :category_name)
  end

end