require 'open-uri'
require 'json'

class UsersController < ApplicationController
  def new
    @city = "Bristol,CT"
    @url = URI.escape("http://api.openweathermap.org/data/2.5/weather?q=#{@city}&units=imperial")
    @json_data = open(@url).read
    @data = JSON.parse(@json_data)
    @weather= @data["weather"]
  end

def create
  users = User.new
    users.first_name = params["first_name"]
    users.email = params["email"]
    users.password = params["pwd"]
    users.save
    redirect_to "/", notice: "Welcome to the ESPN Audio Rater! Please sign in below."
end

def feedback
        @audio = Item.find_by(:id => params[:audio_id])
@user=User.find_by(:id => params[:user_id])
  @city = "Bristol,CT"
    @url = URI.escape("http://api.openweathermap.org/data/2.5/weather?q=#{@city}&units=imperial")
    @json_data = open(@url).read
    @data = JSON.parse(@json_data)
    @weather= @data["weather"]
    @reviews = Review.find_by(:id => params[:review_id])
end

def show
    @user=User.find_by(:id => params[:user_id])
    @city = "Bristol,CT"
    @url = URI.escape("http://api.openweathermap.org/data/2.5/weather?q=#{@city}&units=imperial")
    @json_data = open(@url).read
    @data = JSON.parse(@json_data)
    @weather= @data["weather"]
    if @user.id != session[:user_id]
      redirect_to root_url, notice: "Nice Try!"
    end

def edit
@user=User.find_by(:id => params[:user_id])
    @city = "Bristol,CT"
    @url = URI.escape("http://api.openweathermap.org/data/2.5/weather?q=#{@city}&units=imperial")
    @json_data = open(@url).read
    @data = JSON.parse(@json_data)
    @weather= @data["weather"]
end

  def update
    users = User.find_by(:id => params[:user_id])
    users.first_name = params["first_name"]
    users.email = params["email"]
    users.password = params["password"]
    users.save
    redirect_to "/audio"
  end


end
end
