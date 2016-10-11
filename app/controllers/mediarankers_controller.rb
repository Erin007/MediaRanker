class MediarankersController < ApplicationController
  def index
    @books = Book.order(:votes).reverse_order
  end
end
