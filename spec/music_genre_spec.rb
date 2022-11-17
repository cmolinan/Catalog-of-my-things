require './ruby_classes/music_genre'
require './ruby_classes/item'

describe Genre do
  context 'It should create genre and add items' do
    new_genre = Genre.new(id: 1, name: 'Comedy')
    it 'Should return an instance of Genre' do
      expect(new_genre.name).to eq 'Comedy'
    end

    it 'should add the input item to the collection of items' do
      item = Item.new(id: nil, publish_date: Time.new(2022, 11, 16))
      new_genre.add_item(item)
      expect(new_genre.items.length).to eq 1
    end
  end
end
