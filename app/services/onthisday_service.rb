class OnthisdayService

  def self.get_fact(month, day)
    parse(conn.get("/feed/v1/wikipedia/en/onthisday/all/#{month}/#{day}"))
  end

  private
  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://api.wikimedia.org')
  end

end