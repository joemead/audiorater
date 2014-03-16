require 'open-uri'
require 'json'

class CategoriesController < ApplicationController

 def index
    @city = "Bristol,CT"
    @url = URI.escape("http://api.openweathermap.org/data/2.5/weather?q=#{@city}&units=imperial")
    @json_data = open(@url).read
    @data = JSON.parse(@json_data)
    @weather= @data["weather"]

end
end
