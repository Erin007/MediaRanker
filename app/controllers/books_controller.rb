class BooksController < ApplicationController
  def index
    @books = Book.order(:votes)
  end

  def show
  end

  def edit
  end

  def update
  end

  def new
    @book = Book.new
  end

  def destroy
  end

  def create
  end

end
