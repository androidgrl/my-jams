class SongsController < ApplicationController

  before_action :set_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    #Song.create(song_params)
    @song = Song.new(song_params)
    if @song.save
      redirect_to songs_path
      #redirect_to @song
    else
      flash[:errors] = "Please try again"
        #flash is a message that lasts for request cycle, if you refresh it'll disappear
      render :new
      #we're rendering the new view again if there's a mistake
    end
  end

  def show
    #@song = Song.find(params[:id])
  end

  def edit
    #@song = Song.find(params[:id])
  end

  def update
    #@song = Song.find(params[:id])
    if @song.update(song_params)
      redirect_to @song
    else
      flash[:errors] = "Please try again"
      render :edit
      #you'll need to render the flash error in the view for it to show
    end
  end

  def destroy
    #song = Song.find(params[:id])
    @song.destroy
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist)
  end

  def set_song
    @song = Song.find(params[:id])
  end
end
