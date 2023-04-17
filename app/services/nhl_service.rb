class NhlService
  def self.game_data(team, date)
    response = conn.get("schedule?teamId=#{team}&date=#{date}")
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