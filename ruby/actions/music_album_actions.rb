require_relative '../file_reader'
require_relative '../file_writer'
require_relative '../music_album'

def write_music_albums(music_albums)
  music_albums = music_albums.map do |music_album|
    {
      'on_spotify' => music_album.on_spotify,
      'publish_date' => music_album.publish_date,
      'archived' => music_album.archived
    }
  end

  file_writer = FileWriter.new(music_albums, 'music_albums.json')
  file_writer.write
end

def read_music_albums
  file_reader = FileReader.new('music_albums.json')
  music_albums = file_reader.read
  music_albums.map do |music_album|
    MusicAlbum.new(
      music_album['on_spotify'],
      music_album['publish_date'],
      music_album['archived']
    )
  end
end
