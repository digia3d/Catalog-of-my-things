require_relative './item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :publish_date

  def initialize(multiplayer, last_played_at, publish_date)
    super publish_date
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    Date.today >
      Date.iso8601(@last_played_at).next_year(2) &&
      super
  end
end
