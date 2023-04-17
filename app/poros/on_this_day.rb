class OnThisDay

  attr_reader :text, :year, :description

  def initialize(fact)
    @text = fact[:text]
    @year = fact[:year]
    @description = fact[:pages][0][:extract]
  end
  
end