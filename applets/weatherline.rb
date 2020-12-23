#!/usr/bin/ruby
#require '☔☔☔'
require 'forecast_io'
ForecastIO.api_key = 'cf20d2bc8131e875da42c2f5f85d7282'

forecast = ForecastIO.forecast(37.799944,-122.406361)
temperature = forecast.currently.apparentTemperature

icon = ""
if 	forecast.hourly.icon.include?("rain") || 
	forecast.hourly.summary.downcase.include?("rain")
then	icon =	"☂"
end

if	forecast.minutely.icon.include?("rain") || 
	forecast.minutely.summary.downcase.include?("rain") || 
	forecast.currently.icon.include?("rain") || 
	forecast.currently.summary.downcase.include?("rain") || 
	forecast.currently.precipIntensity > 0 || 
	forecast.currently.precipType ||
	forecast.currently.precipProbability > 25
then	icon ="☔"
end

case forecast.currently.windBearing
when 0..22
  wind = "↓"
when 23..67
  wind = "↙"
when 68..112
  wind = "←"
when 113..157
  wind = "↖"
when 158..202
  wind = "↑"
when 203..247
  wind = "↗"
when 248..292
  wind = "→"
when 293..337
  wind = "↘"
when 338..365
  wind = "↓"
end

puts wind + temperature.round.to_s + '°F ' + forecast.currently.humidity.to_s[2..3] + '%RH' + icon
# ↗55°F 93%RH☔
