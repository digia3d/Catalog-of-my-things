require 'date'
require_relative '../ruby/music_album'
require_relative '../ruby/item'

describe MusicAlbum do
  context 'test music album' do
    let(:music_album) { MusicAlbum.new(true, '2010-01-01', false) }

    it 'should return instance of MusicAlbum' do
      expect(music_album).to be_an_instance_of MusicAlbum
    end

    it 'should have the correct attributes' do
      expect(music_album).to have_attributes(
        on_spotify: true,
        publish_date: Date.iso8601('2010-01-01'),
        archived: false
      )
    end

    it 'should be able to move to archive since on_spotify is true and publish_date is more than 10 years old' do
      music_album.move_to_archive
      expect(music_album.archived).to be true
    end

    it 'should not be able to move to archive when on-spotify is false' do
      music_album.on_spotify = false
      music_album.move_to_archive
      expect(music_album.archived).to be false
    end

    it 'should not be able to move to archive when publish date is less than 10 years ago' do
      music_album.publish_date = Date.iso8601('2019-01-01')
      music_album.move_to_archive
      expect(music_album.archived).to be false
    end
  end
end
