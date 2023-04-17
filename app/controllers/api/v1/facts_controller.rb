class Api::V1::FactsController < ApplicationController
  def index
    binding.pry
    game = NhlFacade.game_overview(params[:team], params[:date])
    team = Team.find_by(venue: game.venue.downcase)
    lat = team.latitude
    lon = team.longitude
    weather = WeatherFactFacade.get_sentence(lat, lon, params[:date])
    month = params[:date][5..6]
    day = params[:date][8..9]
    otd = OnthisdayFacade.get_fact(month, day)

    render json: {facts: "The officials for this game were #{game.officials} #{weather} And on this day in history, #{otd.text}"}
  end
end