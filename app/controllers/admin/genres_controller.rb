class Admin::GenresController < ApplicationController


  def index
    @genres = Genres.all
  end

  def edit
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to genre_path
  end

  def update
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
