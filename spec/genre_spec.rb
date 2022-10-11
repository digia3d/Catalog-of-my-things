require_relative '../ruby/genre'
require_relative '../ruby/music_album'
require_relative '../ruby/item'

describe Genre do
  context 'test genre' do
    let(:genre) { Genre.new('Rock') }
    let(:music_album) { MusicAlbum.new(true, '2010-01-01', false) }

    it 'should return instance of Genre' do
      expect(genre).to be_an_instance_of Genre
    end

    it 'should have the correct attributes' do
      expect(genre).to have_attributes(
        name: 'Rock'
      )
    end

    it 'test add item' do
      allow(music_album).to receive(:genre) { genre }
      expect(music_album).to receive(:genre=)

      genre.add_item(music_album)
      expect(music_album.genre).to eq(genre)
    end
  end
end
