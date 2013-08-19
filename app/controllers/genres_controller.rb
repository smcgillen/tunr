class GenresController < ApplicationController
  before_filter :check_if_admin, :only => [:new, :create, :edit, :update]

  def index
    @genres = Genre.order(:name)
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(params[:genre])
    if @genre.save
      redirect_to(genres_path)
    else
      @obj = @Genre
      render :new
    end
  end

  def edit
    @genre = Genre.find(params[:id])
    render :new
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update_attributes(params[:genre])
      redirect_to(genres_path)
    else
      @obj = @genre
      render :new
    end
  end

  private
  def check_if_admin
    redirect_to(root_path) if @auth.nil? || !@auth.is_admin?
  end

end