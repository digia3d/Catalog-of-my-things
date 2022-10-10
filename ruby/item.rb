require 'date'

class Item
  attr_accessor :publish_date, :archived
  attr_writer :genre, :author, :source, :label

  def initialize(publish_date, archived)
    @id = Random.rand(1...1000)
    @publish_date = Date.iso8601(publish_date)
    @archived = archived
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  attr_reader :id

  def can_be_archived?
    date = Date.today.year - @publish_date.year
    date > 10
  end
end
