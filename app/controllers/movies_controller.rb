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
  end

  def update
  end

  def new
  end

  def destroy
  end

  def create
  end
end
