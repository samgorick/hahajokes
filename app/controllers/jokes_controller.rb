class JokesController < ApplicationController

  def new 
    @joke = Joke.new
  end

  def create
    @joke = Joke.new(joke_params)
    if @joke.valid?
      @joke.save
      redirect_to joke_path(@joke)
    else 
      render :new
    end
  end

  def show
    @joke = Joke.find(params[:id])
  end

  def index
    @jokes = Joke.all
  end

  def edit
    @joke = Joke.find(params[:id])
  end

  def update
    @joke = Joke.find(params[:id])
    @joke.assign_attributes(joke_params)
    if @joke.valid?
      @joke.save
      redirect_to joke_path(@joke)
    else 
      render :edit
    end
  end

  private

  def joke_params
    params.require(:joke).permit(:lead_up, :punchline, :keyword, :funniness, :claire_laugh, :category_name)
  end

end