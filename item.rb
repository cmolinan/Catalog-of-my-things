class Item
  attr_accessor :genre, :author, :source, :label, :publish_date, :archived

  def initialize(id:,publish_date: archived: false)
    @id = id || Random.rand(1..1000)
    @publish_date = publish_date
    @archived = archived
  end

  def add_genre(genre)
    @genre = genre
  end

  def add_author(author)
    @author = author
  end

  def add_source(source)
    @source = source
  end

  def add_label(label)
    @label = label
  end

  def move_to_archive
    @archived = can_be_archived? == true
  end

  private

  private

  def can_be_archived?
    Time.new.year - publish_date > 10
  end
end
