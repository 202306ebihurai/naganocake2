class Admin::GenresController < ApplicationController
    def index
     @genre_new = Genre.new
     @genres = Genre.all
     @genre = Genre.find(params[:id])
    end
   
   def create
     @genre = Genre.new(genre_params)
     @genre.save
     redirect_to admin_genres_path
   end
   
end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

