class OnthisdayFacade
  def self.get_fact(month, day)
    facts = OnthisdayService.get_fact(month, day)
    fact = facts[:selected].shuffle.first

    OnThisDay.new(fact)
  end
end