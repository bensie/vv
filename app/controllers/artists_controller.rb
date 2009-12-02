class ArtistsController < ApplicationController
  before_filter :get_artist, :only => [:show, :edit, :update, :destroy]

  def index
    @artists = Artist.all
  end
  
  def show
    render
  end
  
  def new
    @artist = Artist.new
  end
  
  def create
    @artist = Artist.new(params[:artist])
    if @artist.save
      flash[:notice] = "Successfully created artist."
      redirect_to @artist
    else
      render :action => 'new'
    end
  end
  
  def edit
    render
  end
  
  def update
    if @artist.update_attributes(params[:artist])
      flash[:notice] = "Successfully updated artist."
      redirect_to @artist
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @artist.destroy
    flash[:notice] = "Successfully destroyed artist."
    redirect_to artists_url
  end
  
  protected
  
  def get_artist
    @artist = Artist.find(params[:id])
  end
end
