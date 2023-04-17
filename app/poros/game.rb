class Game
  attr_reader :details,
              :overview

  def initialize(overview, details)
    @overview = overview
    @details = details
  end

  def home_team
    overview[:dates][0][:games][0][:teams][:home][:team][:name]
  end

  def officials
    details[:officials].map do |off|
      off[:official][:fullName]
    end.to_sentence
  end

  def venue
    overview[:dates][0][:games][0][:venue][:name]
  end
end