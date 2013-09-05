class TvShowsController < ApplicationController

  before_action :find_tv_show, only: %w(edit update show destroy)

  def index
    @tv_shows = TvShow.all
  end

  def new
    @tv_show = TvShow.new
  end

  def create
    @tv_show = TvShow.new tv_show_params
    if @tv_show.save
      flash.notice = "Show saved!"
      redirect_to @tv_show
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @tv_show.update tv_show_params
      flash.notice = "Updated show!"
      redirect_to tv_show_url(@tv_show)
    else
      render "edit"
    end
  end

  def show
  end

  def destroy
    @tv_show.destroy
    redirect_to tv_shows_url
  end

  private

  def find_tv_show
    @tv_show = TvShow.find(params[:id])
  end

  def tv_show_params
    params.require(:tv_show).permit(
      :title, :about)
  end
end
