#!/usr/bin/ruby
require 'forecast_io'
ForecastIO.api_key = 'cf20d2bc8131e875da42c2f5f85d7282'

forecast = ForecastIO.forecast(37.799944,-122.406361)

humidity = forecast.currently.humidity*100
temperature = forecast.currently.apparentTemperature

rain = ""
rain =
	forecast.hourly.icon.include?("rain") || 
	forecast.hourly.summary.downcase.include?("rain") ? 
	"☂" : rain
rain =
	forecast.currently.icon.include?("rain") || 
	forecast.currently.summary.downcase.include?("rain") || 
	forecast.currently.precipIntensity > 0 || 
	forecast.currently.precipType ||
	forecast.currently.precipProbability > 5 ?
	"☔" : rain
case forecast.currently.windBearing
when 0..22
  wind = "⇓"
when 23..67
  wind = "⇙"
when 68..112
  wind = "⇐"
when 113..157
  wind = "⇖"
when 158..202
  wind = "⇑"
when 203..247
  wind = "⇗"
when 248..292
  wind = "⇒"
when 293..337
  wind = "⇘"
when 338..365
  wind = "⇓"
end
puts wind + temperature.round.to_s + '°F ' + humidity.round.to_s + '%RH' + rain
