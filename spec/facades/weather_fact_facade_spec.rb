require 'rails_helper'

RSpec.describe WeatherFactFacade do
  describe '.get_fact()', :vcr do
    it 'returns a weather poro' do
      weather_fact = WeatherFactFacade.get_fact(33.45, -112.07, "2023-04-11")

      expect(weather_fact).to be_a WeatherFact
    end
  end

  describe '.fact_sentence()', :vcr do
    it 'returns a formatted sentence with a weather fact' do
      sentence = WeatherFactFacade.fact_sentence(47.61, -122.33, "2023-04-01")

      expect(sentence).to include("72.0 meters")
      expect(sentence).to include("sunset was at 19:40")
      expect(sentence).to include("there were 11.0 hours of precipitation")
    end
  end
end

# "The approixmate elevation is 72.0, on this date sunset was at 19:40, and there were 11.0 hours of precipitation.