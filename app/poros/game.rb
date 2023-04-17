class Game
  attr_reader :details,
              :overview

  def initialize(overview, details)
    @overview = overview
    @details = details
  end
end