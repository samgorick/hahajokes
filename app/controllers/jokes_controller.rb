class JokesController < ApplicationController

  def new 
    @joke = Joke.new
  end

  def create
    @joke = Joke.new(joke_params)
    if @joke.save
      flash[:affirms] = "Joke successfully created!"
      redirect_to @joke
    else 
      flash[:alerts] = "Oops! Something went wrong."
      flash[:errors] = @joke.errors.full_messages
      redirect_to new_joke_path
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
      flash[:affirms] = "Joke successfully updated!"
      redirect_to @joke
    else 
      flash[:alerts] = "Oops! Something went wrong."
      flash[:errors] = @joke.errors.full_messages
      render :edit
    end
  end

  private

  def joke_params
    params.require(:joke).permit(:lead_up, :punchline, :keyword, :funniness, :claire_laugh, :category_name)
  end

end