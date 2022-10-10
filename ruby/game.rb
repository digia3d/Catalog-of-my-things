require_relative './item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :publish_date

  def initialize(multiplayer, last_played_at, publish_date)
    super (publish_date, false)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super && (@last_played_at.year < Date.today.year -2)
  end
end
