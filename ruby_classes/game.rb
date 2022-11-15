require_relative './item'

class Game < Item
    attr_accessor :multiplayer, :last_played_at
    def initialize(multiplayer, last_played_at, *args)
        super(*args)
        @multiplayer = multiplayer
        @last_played_at = last_played_at
    end

    private

    def can_be_archived?
        super && Time.new.year - last_played_at > 2
    end
end