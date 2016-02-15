class UrlsController < ApplicationController
  def new
    @url = Url.new
  end

  def create
    @url = Url.new(clean_params)
    puts clean_params
    @url.save
    redirect_to new_url_path(id: @url.id)
  end

  def show
    @url = Url.find(params[:id])
    redirect_to(@url.original_url)
  end

  def clean_params
    params.require(:url).permit(:original_url)
  end
end
