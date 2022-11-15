class Genre
  attr_accessor :archived, :items, :name

  def initialize(id:, name:)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.add_genre(self)
  end
end
