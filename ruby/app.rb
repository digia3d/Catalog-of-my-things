require 'date'
require_relative 'music_album'
require_relative 'genre'

class App
  attr_reader :music_albums, :genres

  def initialize
    @name = 'John Doe'
    @music_albums = []
    @genres = []
  end

  # add music album to the list
  def add_music_album
    puts 'Is the music album on spotify? [Y/N]: '
    spotify = gets.chomp.capitalize

    case spotify
    when 'Y'
      spotify = true
    when 'N'
      spotify = false
    else
      puts 'Invalid response. Please try again...'
      return
    end

    puts 'Enter publication date: '
    date = gets.chomp

    music_album = MusicAlbum.new(spotify, date, false)
    music_albums << music_album
    puts
    puts 'Music album created successfully!'
    sleep(1)
    puts
  end

  # list all music albums
  def list_music_albums
    if @music_albums.length.positive?
      @music_albums.each_with_index do |album, index|
        puts "#{index}). On-spotify: #{album.on_spotify}, Publication Date: #{album.publish_date}"
      end
    else
      # if music album is empty
      puts
      puts 'There are currently no music albums'
    end
    puts
    sleep(1)
    puts
  end

  # list all genres
  def list_genres
    if @genres.length.positive?
      @genres.each_with_index do |genre, index|
        puts "#{index}). Genre: #{genre.name}"
      end
    else
      # if genre is empty
      puts
      puts 'There are currently no genres'
    end
    puts
    sleep(1)
    puts
  end
end
