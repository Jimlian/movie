class MoviesController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :eidit, :update, :destroy]

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    @posts = @movie.posts
  end

  def edit
   @movie = Movie.find(params[:id])

   if current_user != @movie.user
     redirect_to root_path, alert: "You have no permission."
   end
 end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.user = current_user

    if @movie.save
    redirect_to movies_path
  else
    render :new
  end
  end

  def update
    @movie = Movie.find(params[:id])

    @movie.update(movie_params)

    redirect_to movies_path, notice: "更新成功"
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:alert] = " 影片已删除"
    redirect_to movies_path
  end



  private

  def movie_params
    params.require(:movie).permit(:title, :description)
  end

end
