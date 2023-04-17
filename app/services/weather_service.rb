class WeatherService
  def self.conn
    url = 'https://archive-api.open-meteo.com'
    Faraday.new(url: url)
  end

  def self.weather_facts(lat, long, date)
    response = conn.get('v1/archive') do |f|
      f.params['latitude'] = lat
      f.params['longitude'] = long
      f.params['start_date'] = date
      f.params['end_date'] = date
      f.params['daily'] = %w[sunset precipitation_hours]
      f.params['timezone'] = 'auto'
    end
    parse(response)
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
