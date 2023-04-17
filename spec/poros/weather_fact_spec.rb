require 'rails_helper'

RSpec.describe WeatherFact do
  before(:each) do
    @weather_data = { latitude: 33.5,
                      longitude: -112.1,
                      generationtime_ms: 0.5609989166259766,
                      utc_offset_seconds: -25_200,
                      timezone: 'America/Phoenix',
                      timezone_abbreviation: 'MST',
                      elevation: 335.0,
                      daily_units: { time: 'iso8601', sunset: 'iso8601', precipitation_hours: 'h' },
                      daily: { time: ['2023-04-11'], sunset: ['2023-04-11T18:57'],
                               precipitation_hours: [0.0] } }
  end

  it 'exists with attributes' do
    fact = WeatherFact.new(@weather_data)

    expect(fact).to be_a WeatherFact
    expect(fact.elevation).to eq(335.0)
    expect(fact.sunset_time).to eq('2023-04-11T18:57')
    expect(fact.precipitation_hours).to eq(0.0)
  end

  describe '#sunset' do
    it 'returns a XX:XX XM formatted time of the sunset' do
      fact = WeatherFact.new(@weather_data)

      expect(fact.sunset).to eq('18:57')
    end
  end
end
