class BooksController < ApplicationController
  def book
    @book ||= Book.find(params[:id].to_i)
  end

  def index
    @books = Book.order(:votes).reverse_order
  end

  def show
    book
  end

  def edit
  end

  def update
  end

  def new
    @book = Book.new
  end

  def destroy
    book.destroy
    redirect_to :books
  end

  def create
  end

end
