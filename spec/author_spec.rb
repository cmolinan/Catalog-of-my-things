require './ruby_classes/author'
require './ruby_classes/game'

describe Author do
  before(:each) do
    @author = Author.new('Agatha', 'Christie')
  end

  describe 'Author name attributes' do
    it 'should return first and last name' do
      expect(@author).to have_attributes(first_name: 'Agatha')
      expect(@author).to have_attributes(last_name: 'Christie')
    end
  end

  describe 'add-item method' do
    it 'should return an array of objects' do
      game = Game.new(true, 2022, 2019)
      @author.add_item(game)
      expect(@author.items).to include(game)
    end
  end
end
