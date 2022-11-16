require './ruby_classes/game'

describe Game do
  describe 'Create a game' do
    it 'should return a instance' do
      game = Game.new(false, 2022, 2018)
      expect(game).to be_instance_of Game
    end

    it 'should have attributtes' do
      game = Game.new(false, 2022, 2018)
      expect(game.last_played_at).to be_kind_of Numeric
      expect(game.publish_date).to be_kind_of Numeric
      expect(game).to have_attributes(multiplayer: false)
      expect(game).to have_attributes(last_played_at: 2022)
      expect(game).to have_attributes(publish_date: 2018)
    end

    it 'should set a value of true to Multiplayer attribute' do
      game = Game.new(true, 2022, 2018)
      expect(game).to have_attributes(multiplayer: true)
    end
  end

  describe 'can_be_archived?' do
    it 'Should return true if it has more than 2 years' do
      game = Game.new(false, 2019, 2009)
      expect(game.send(:can_be_archived?)).to be true
    end

    it 'Should return false if it has less than 2 years' do
      game = Game.new(false, 2021, 2009)
      expect(game.send(:can_be_archived?)).to be false
    end
  end
end
