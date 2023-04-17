class WeatherFact
  attr_reader :elevation, :sunset_time, :precipitation_hours

  def initialize(weather_data)
    @elevation = weather_data[:elevation]
    @sunset_time = weather_data[:daily][:sunset].first
    @precipitation_hours = weather_data[:daily][:precipitation_hours].first
  end

  def sunset
    self.sunset_time.split('T')[1]
  end
end