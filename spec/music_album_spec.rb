require './ruby_classes/music_album'

describe MusicAlbum do
  context 'When MusicAlbum is on_spotity to true' do
    music_album_one = MusicAlbum.new('name', Time.new(11 / 15 / 2022), true)
    it 'Should return an instance of the Class musicAlbum' do
      expect(music_album_one).to be_an_instance_of MusicAlbum
    end

    it 'should set on_spotify a value of true' do
      expect(music_album_one).to have_attributes(on_spotify: true)
    end
  end

  context 'When MusicAlbum is on_spotity to false' do
    music_album_two = MusicAlbum.new('name', Time.new(11 / 15 / 2022), false)
    it 'Should return an instance of the Class musicAlbum' do
      expect(music_album_two).to be_an_instance_of MusicAlbum
    end

    it 'should set on_spotify value of false' do
      expect(music_album_two).to have_attributes(on_spotify: false)
    end
  end
end
