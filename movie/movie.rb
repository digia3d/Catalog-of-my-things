require 'date'
require_relative '../ruby/item'

class Movie
  attr_accessor :silent, :publish_date

  def initialize(silent, publish_date)
    super(publish_date, archived)
    @silent = silent
    @publish_date = publish_date
    @archived = archived
  end
end
