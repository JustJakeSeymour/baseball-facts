require 'rails_helper'

RSpec.describe OnthisdayService do
  it 'can return a random fact for a date', :vcr do 
    response = OnthisdayService.get_fact('01', '01')

    expect(response).to be_a(Hash)
  end
end