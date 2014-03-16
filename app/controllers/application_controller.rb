require 'open-uri'
require 'json'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def conditions
    @city = Bristol,CT
    url = URI.escape("http://api.openweathermap.org/data/2.5/weather?q=#{@city}&units=imperial")
    @json_data = open(url).read
    @data = JSON.parse(@json_data)
  end
end
