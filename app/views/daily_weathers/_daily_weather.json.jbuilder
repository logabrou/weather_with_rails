json.extract! daily_weather, :id, :date, :time, :temperature, :created_at, :updated_at
json.url daily_weather_url(daily_weather, format: :json)
