
class EntertainmentoptionsController < ApplicationController
  def media
    @entertainmentoption ||= Entertainmentoption.find(params[:id].to_i)
  end

  def index
    @books = Entertainmentoption.where(mediatype: 'book').order(:votes).reverse_order
    @movies = Entertainmentoption.where(mediatype: 'movie').order(:votes).reverse_order
    @albums = Entertainmentoption.where(mediatype: 'album').order(:votes).reverse_order
  end

  def new
    @entertainmentoption = Entertainmentoption.new
  end

  def show
    @entertainmentoptions = Entertainmentoption.all
    @book = nil
    @album = nil
    @movie = nil

    @entertainmentoptions.each do |media|
      number = params[:id].to_i
      if media[:id] == number
        @media = media
      end

      if media[:id] == number && media[:mediatype] == "book"
        @book = media
      elsif media[:id] == number && media[:mediatype] == "album"
        @album = media
      elsif media[:id] == number && media[:mediatype] == "movie"
        @movie = media
      end
    end
  end

  def edit
    media
  end

  def update
    media.update_attributes(media_params)
    redirect_to root
  end

  def create
    @entertainmentoption = Entertainmentoption.new(
                     mediatype:params[:entertainmentoption][:mediatype],
                     name:params[:entertainmentoption][:name],
                     author:params[:entertainmentoption][:author],
                     artist:params[:entertainmentoption][:artist],
                     director:params[:entertainmentoption][:director],
                     description:params[:entertainmentoption][:description],
                     votes: 0)
   @entertainmentoption.save
   redirect_to :entertainmentoption
  end

  def destroy
    @media = Entertainmentoption.find(params[:id]).destroy
    redirect_to root_path  #change this
  end

  def up_vote
    @media = Entertainmentoption.find(params[:id])
    @media.update_attribute(:votes, (@media.votes + 1))
    redirect_to(request.referer)
  end

private
    def media_params
       params.require(:entertainmentoption).permit( :mediatype, :name, :author, :artist, :director, :description, :votes)
    end
end
