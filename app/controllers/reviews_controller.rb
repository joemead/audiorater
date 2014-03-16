require 'open-uri'
require 'json'

class ReviewsController < ApplicationController

  def create
    review = Review.new
    review.title = params[:title]
    review.body = params[:body]
    review.rating = params[:rating]
    review.item_id = params[:item_id]
    review.user_id = params[:user_id]
    review.save
    redirect_to "/audio/#{review.item_id}/show"
  end

 def index
    @city = "Bristol,CT"
    @url = URI.escape("http://api.openweathermap.org/data/2.5/weather?q=#{@city}&units=imperial")
    @json_data = open(@url).read
    @data = JSON.parse(@json_data)
    @weather= @data["weather"]
end

end
