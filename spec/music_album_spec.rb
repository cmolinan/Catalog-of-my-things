require './ruby_classes/music_album'

describe MusicAlbum do
  context 'When MusicAlbum is on_spotity to true' do
    music_album_one = MusicAlbum.new('name', Time.new(11 / 15 / 2022), true)
    it 'Should return an instance of the Class musicAlbum' do
      expect(music_album_one).to be_an_instance_of MusicAlbum
    end
  end

  context 'When MusicAlbum is on_spotity to false' do
    music_album_two = MusicAlbum.new('name', Time.new(11 / 15 / 2022), false)
    it 'Should return an instance of the Class musicAlbum' do
      expect(music_album_two).to be_an_instance_of MusicAlbum
    end
  end
end

describe MusicAlbum do
  context 'When MusicAlbum is on_spotity to true' do
    music_album_three = MusicAlbum.new('name', Time.new(11 / 14 / 2022), true)
    it 'Should return an instance of the Class musicAlbum' do
      expect(music_album_three).to be_an_instance_of MusicAlbum
    end
  end

  context 'When MusicAlbum is on_spotity to false' do
    music_album_four = MusicAlbum.new('name', Time.new(11 / 14 / 2022), false)
    it 'Should return an instance of the Class musicAlbum' do
      expect(music_album_four).to be_an_instance_of MusicAlbum
    end
  end
end

describe MusicAlbum do
  context 'When MusicAlbum is on_spotity to true' do
    music_album_five = MusicAlbum.new('name', Time.new(11 / 14 / 2022), true)
    it 'Should return an instance of the Class musicAlbum' do
      expect(music_album_five).to be_an_instance_of MusicAlbum
    end
  end

  context 'When MusicAlbum is on_spotity to false' do
    music_album_six = MusicAlbum.new('name', Time.new(11 / 14 / 2022), false)
    it 'Should return an instance of the Class musicAlbum' do
      expect(music_album_six).to be_an_instance_of MusicAlbum
    end
  end
end
