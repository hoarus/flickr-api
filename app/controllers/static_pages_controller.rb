class StaticPagesController < ApplicationController

  require 'flickr'

  def index
    flickr = Flickr.new ENV["flickr_key"], ENV["flickr_secret"]
    unless params[:user_id].blank?
      @photos = flickr.photos.search(user_id: params[:user_id])
    end
  rescue StandardError => e
    flash[:alert] = "#{e.message}. Please try again..."
    redirect_to root_path
  end 


end