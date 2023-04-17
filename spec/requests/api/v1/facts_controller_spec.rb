require 'rails_helper'

RSpec.describe 'facts controller' do
  it 'returns a json response of facts', :vcr do
    get api_v1_facts_path(date: '2023-04-11', team: 'avalanche')

    expect(response).to be_successful
  end
end