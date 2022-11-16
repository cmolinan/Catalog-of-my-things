require 'pry'
require './ruby_classes/music_genre'
require './ruby_classes/item'

describe Genre do
  context 'It should create genre and add items' do
    new_genre = Genre.new(name: 'Trajedy')
    it 'Should return an instance of Genre' do
      expect(new_genre.name).to eq 'Trajedy'
    end

    it 'should add the input item to the collection of items' do
      # item = Item.new(publish_date: Time.new(11 / 15 / 2022))
      item = Item.new(Time.new(11 / 15 / 2022))
      new_genre.add_item(item)
      expect(new_genre.items.length).to eq 1
    end
  end
end
