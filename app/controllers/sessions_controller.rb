require 'open-uri'
require 'json'

class SessionsController < ApplicationController
  def new
        @city = "Bristol,CT"
    @url = URI.escape("http://api.openweathermap.org/data/2.5/weather?q=#{@city}&units=imperial")
    @json_data = open(@url).read
    @data = JSON.parse(@json_data)
    @weather= @data["weather"]
  end

  def destroy
    reset_session
    redirect_to root_url, notice: "Come visit the ESPN Audio Rater again soon!"
  end

  def create
    user = User.find_by(:email => params[:email])
    if user.present?
      if user.password == params[:pwd]
        session[:user_id] = user.id
        redirect_to "/audio", notice: "Nice job logging in! Listen and rate some audio!"
      else
        redirect_to root_url, notice: "Wrong Password."
      end
    else
      redirect_to root_url, notice: "Unknown user."
    end
  end

end
