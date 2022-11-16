require './ruby_classes/item'

class Book < Item
  attr_accessor :publisher, :cover_state, :title

  def initialize(publisher, cover_state, publish_date)
    super(id: nil, publish_date: publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
