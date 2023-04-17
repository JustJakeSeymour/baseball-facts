require 'rails_helper'

RSpec.describe 'OnThisDayFacade' do
  it 'can return a random fact for a date', :vcr do
    fact = OnthisdayFacade.get_fact('01', '01')

    expect(fact).to be_a(OnThisDay)
    expect(fact.text).to be_a(String)
    expect(fact.year).to be_a(Integer)
    expect(fact.description).to be_a(String)
  end
end