class Source
  attr_accessor :name
  attr_reader :items

  def initialize(name)
    @id = Random.rand(1..1100)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_source self
  end
end
