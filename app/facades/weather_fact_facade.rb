class WeatherFactFacade
  def self.get_fact(lat, long, date)
    weather_data = WeatherService.weather_facts(lat, long, date)
    WeatherFact.new(weather_data)
  end

  def self.fact_sentence(lat, long, date)
    fact = get_fact(lat, long, date)
    "The approixmate elevation is #{fact.elevation} meters, on this date sunset was at #{fact.sunset}, and there were #{fact.precipitation_hours} hours of precipitation."
  end
end