class HighChartsController < ApplicationController
  def data
    # this method is to send manually json data 
    #render json: {name: 'test',data: [2,0,9,23,2,123]}
    # or read data from a data.json file, use your custom path
    data = File.read("#{Rails.root}/app/views/highcharts/data.json")
    render json: data
  
  end
end