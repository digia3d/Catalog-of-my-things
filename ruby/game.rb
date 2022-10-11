require_relative './item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :publish_date

  def initialize(multiplayer, last_played_at, publish_date, archived)
    super(publish_date, archived)
    @multiplayer = multiplayer
    @last_played_at = Date.iso8601(last_played_at)
  end

  private

  def can_be_archived?
    (Date.today > @last_played_at.next_year(2)) && super
  end
end
