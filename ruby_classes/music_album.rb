require_relative 'item'

class MusicAlbum < Item
    attr_accessor :on_spotify, :archived, :name
    attr_reader :publish_date
end