require 'rails_helper'

RSpec.describe NhlService, type: :service do
  context 'class methods' do
    it 'game_data', :vcr do
      team = '21'
      date = '2023-04-11'
      service = NhlService.game_overview(team, date)

      expect(service).to be_a(Hash)
      expect(service).to have_key(:dates)
    end
  end
end