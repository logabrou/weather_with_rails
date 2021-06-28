class DailyWeathersController < ApplicationController
  before_action :set_daily_weather, only: %i[ show edit update destroy ]

  # GET /daily_weathers or /daily_weathers.json
  def index
    @daily_weathers = DailyWeather.all
  end

  # GET /daily_weathers/1 or /daily_weathers/1.json
  def show
  end

  # GET /daily_weathers/new
  def new
    @daily_weather = DailyWeather.new
    require 'net/http'
    require 'json'
    @url = 'http://api.worldweatheronline.com/premium/v1/past-weather.ashx?key=9a0f0f2d66564e8091f65045211906&q=Austin&format=json&date=2021-06-20&enddate=2021-06-22&tp=3'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)

  end

  # GET /daily_weathers/1/edit
  def edit
  end

  # POST /daily_weathers or /daily_weathers.json
  def create
    @daily_weather = DailyWeather.new(daily_weather_params)

    respond_to do |format|
      if @daily_weather.save
        format.html { redirect_to @daily_weather, notice: "Daily weather was successfully created." }
        format.json { render :show, status: :created, location: @daily_weather }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @daily_weather.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /daily_weathers/1 or /daily_weathers/1.json
  def update
    respond_to do |format|
      if @daily_weather.update(daily_weather_params)
        format.html { redirect_to @daily_weather, notice: "Daily weather was successfully updated." }
        format.json { render :show, status: :ok, location: @daily_weather }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @daily_weather.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daily_weathers/1 or /daily_weathers/1.json
  def destroy
    @daily_weather.destroy
    respond_to do |format|
      format.html { redirect_to daily_weathers_url, notice: "Daily weather was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daily_weather
      @daily_weather = DailyWeather.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def daily_weather_params
      params.require(:daily_weather).permit(:date, :time, :temperature)
    end
end
