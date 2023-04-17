class NhlService
  def self.game_overview(team, date)
    response = conn.get("schedule?teamId=#{team}&date=#{date}")
    parse_json(response)
  end

  def self.game_details(game_id)
    response = conn.get("game/#{game_id}/boxscore")  
    parse_json(response)
  end

  def self.conn
    Faraday.new(
      url: 'https://statsapi.web.nhl.com/api/v1/'
    )
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end