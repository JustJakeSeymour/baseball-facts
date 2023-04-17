require 'rails_helper'

RSpec.describe WeatherService do
  it 'returns info about the weather', :vcr do
    weather_data = WeatherService.weather_facts(39.74, -104.98, '2023-04-11')

    expect(weather_data).to be_a Hash
    expect(weather_data.keys.sort).to eq(%i[daily daily_units elevation generationtime_ms latitude longitude
                                            timezone timezone_abbreviation utc_offset_seconds].sort)
    expect(weather_data[:elevation]).to be_a Float
    expect(weather_data[:daily].keys.sort).to eq(%i[time sunset precipitation_hours].sort)
  end
end
