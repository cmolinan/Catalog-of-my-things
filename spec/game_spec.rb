require './ruby_classes/game'

describe Game do
  context 'test game' do
    before :each do
      @game = Game.new(false, '2010-9-8', '2008-9-9')
    end

    it 'check instance' do
      expect(@game).to be_an_instance_of Game
    end

    it 'check publish_date' do
      expect(@game.publish_date).to eq '2008-9-9'
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

    it 'check last_played_at' do
      expect @last_played_at == '2010-9-8'
    end

    it 'check multiplayer' do
      expect @multiplayer == false
    end
  end
end
