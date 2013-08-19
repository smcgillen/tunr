class ArtistsController < ApplicationController
  before_filter :check_if_admin, :only => [:new, :create, :edit, :update]

  def index
    @artists = Artist.order(:name)
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(params[:artist])
    if @artist.save
      redirect_to(artists_path)
    else
      @obj = @artist
      render :new
    end
  end

  def edit
    @artist = Artist.find(params[:id])
    render :new
  end

  def update
    @artist = artist.find(params[:id])
    if @artist.update_attributes(params[:artist])
      redirect_to(artists_path)
    else
      @obj = @artist
      render :new
    end
  end

  private
  def check_if_admin
    redirect_to(root_path) if @auth.nil? || !@auth.is_admin?
  end

end