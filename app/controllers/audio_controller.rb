require 'open-uri'

class AudioController < ApplicationController

  def index
    @city = "Bristol,CT"
    @url = URI.escape("http://api.openweathermap.org/data/2.5/weather?q=#{@city}&units=imperial")
    @json_data = open(@url).read
    @data = JSON.parse(@json_data)
    @weather= @data["weather"]

    if params[:cat].present?
      filter_category = Category.find_by(:name => params[:cat])
      @audio_list = Item.all.where(:category_id => filter_category.id)
      @audio_list = @audio_list.order('name asc')
    else
      @audio_list = Item.all.order('name asc')
    end
  end

  def show
    @audio = Item.find_by(:id => params[:audio_id])
    @category = Category.find_by(:name => params[:cat])
   @city = "Bristol,CT"
    @url = URI.escape("http://api.openweathermap.org/data/2.5/weather?q=#{@city}&units=imperial")
    @json_data = open(@url).read
    @data = JSON.parse(@json_data)
    @weather= @data["weather"]
    @reviews = Review.where(:item_id => @audio.id).order('created_at desc')
    if params[:first_name].present?
    @users = User.find_by(:id => params[:user_id])
  end

  def new
  end

  def create
    audio = Item.new
    audio.name = params["name"]
    audio.date = params["date"]
    audio.description = params["description"]
    audio.link = params["link"]
    audio.image_url = params["image_url"]
    audio.save
    redirect_to "/audio"
  end

  def edit
    @audio = Item.find_by(:id => params[:audio_id])
  end

  def update
    audio = Item.find_by(:id => params[:audio_id])
   audio.name = params["name"]
    audio.date = params["date"]
    audio.description = params["description"]
    audio.link = params["link"]
    audio.image_url = params["image_url"]
    audio.save
    redirect_to "/audio"
  end
end
end
