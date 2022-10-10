class Item
  attr_accessor :publish_date, :archived, :genre, :author, :source, :label
  attr_reader :id

  def initialize(publish_date, archived)
    @id = Random.rand(1...1000)
    @publish_date = publish_date
    @archived = archived
  end
end
