class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'
    @url = 'http://api.worldweatheronline.com/premium/v1/past-weather.ashx?key=9a0f0f2d66564e8091f65045211906&q=Austin&format=json&date=2021-05-25&enddate=2021-06-25&tp=3'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)
  end

  def show
    require 'net/http'
    require 'json'
    @url = 'http://api.worldweatheronline.com/premium/v1/past-weather.ashx?key=9a0f0f2d66564e8091f65045211906&q=Austin&format=json&date=2021-05-25&enddate=2021-06-25&tp=3'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)

    @data = DailyWeather.all
    # @data.temperature = params[:temperature]
    # @data.time = params[:time]
    # json: @data
    # @data_jason = @data.to_json
    @data.each do |daily|
      
    tempy = DailyWeather.new(:temperature => @temperature)
  end
end

end


