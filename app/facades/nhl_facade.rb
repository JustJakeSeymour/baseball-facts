class NhlFacade
  def self.game_overview(team, date)
    json = NhlService.game_overview(team, date)

    game_details(json)
  end

  def self.game_details(json)
    game_id = json[:dates].first[:games].first[:gamePk]

    details = NhlService.game_details(game_id)

    game = Game.new(json, details)
  end
end