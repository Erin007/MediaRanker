class MoviesController < ApplicationController

  def movie
    @movie ||= Movie.find(params[:id].to_i)
  end

  def index
    @movies = Movie.order(:votes).reverse_order
  end

  def show
    movie
  end

  def edit
    movie
  end

  def update
    movie.update_attributes(movie_params)
    redirect_to movie_path
  end

  def new
    @movie = Movie.new
  end

  def destroy
    movie.destroy
    redirect_to :movies
  end

  def create
    @movie = Movie.new(name:params[:movie][:name],
                     director:params[:movie][:director],
                     description:params[:movie][:description],
                     votes: 0)
    @movie.save
    redirect_to :movies
  end

private
 def movie_params
   #Tells Rails which parameters can be changed
   params.require(:movie).permit( :name, :director, :description, :votes)
 end
end
