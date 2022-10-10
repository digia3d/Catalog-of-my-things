require_relative 'item'

class Book < Item
  attr_accessor :cover_state, :publisher

  def initialize(publisher, cover_state, publish_date, archived)
    super(publish_date, archived)
    @publisher = publisher
    @cover_state = cover_state
  end
end
