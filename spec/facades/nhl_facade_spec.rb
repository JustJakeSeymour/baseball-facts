require 'rails_helper'

RSpec.describe NhlFacade, type: :facade do
  context 'class methods' do
    it 'game_overview', :vcr do
      team = '21'
      date = '2023-04-11'

      expect(NhlFacade.game_overview(team, date)).to be_a(Game)
    end
  end
end