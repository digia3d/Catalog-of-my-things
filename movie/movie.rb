require 'date'
require_relative '../ruby/item'

class Movie < Item
  attr_accessor :silent, :publish_date

  def initialize(silent, publish_date, archived)
    super(publish_date, archived)
    @silent = silent
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
    return true if @silent && super
  end

  private :can_be_archived?
end
