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
    book
  end

  def update
    book.update_attributes(book_params)
    redirect_to book_path
  end

  def new
    @book = Book.new
  end

  def destroy
    book.destroy
    redirect_to :books
  end

  def create
    @book = Book.new(name:params[:book][:name],
                     author:params[:book][:author],
                     description:params[:book][:description],
                     votes: 0)
   @book.save
   redirect_to :books
  end

  def up_vote
    book.update_attribute(:votes, (book.votes + 1))
    redirect_to book_path
  end

private
   def book_params
     #Tells Rails which parameters can be changed
     params.require(:book).permit( :name, :author, :description, :votes)
   end


end
