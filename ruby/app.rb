require 'date'
require_relative 'book'
require_relative 'music_album'
require_relative 'genre'
require_relative 'game'
require_relative 'author'

class App
  attr_reader :music_albums, :genres

  def initialize
    @books = []
    @labels = []
    @music_albums = []
    @genres = []
    @games = []
    @authors = []
  end

  def add_book
    print 'Publisher: '
    publisher = gets.chomp
    print 'Cover State: '
    cover_state = gets.chomp.downcase
    print 'Publish Date (yyyy-mm-dd): '
    publish_date = gets.chomp
    print 'Is the book archived? (Y/N): '
    archived_str = gets.chomp
    archived = %w[Y YES].include?(archived_str.upcase)

    book = Book.new(publisher, cover_state, publish_date, archived)
    @books << book
    print "\n Book Created Successfully 🎉 \n"
  end

  def list_books
    print "Books (#{@books.length}) ⬎ "
    print "\n currently no books here" if @books.empty?
    @books.each_with_index do |book, index|
      print "\n • [#{index}] #{book.publish_date.strftime('%a %d %b %Y')}, published by #{book.publisher}"
    end

    print "\n"
  end

  def list_labels
    print "Labels (#{@labels.length}) ⬎ "
    print "\n currently no labels here" if @labels.empty?
    @labels.each do |label|
      print "\n • #{label.title} - #{label.color}"
    end

    print "\n"
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

    puts 'Enter publication date (yyyy-mm-dd):'
    date = gets.chomp

    puts 'Is it archived? [Y/N]:'
    archived_str = gets.chomp
    archived = %w[Y YES].include?(archived_str.upcase)

    music_album = MusicAlbum.new(spotify, date, archived)
    @music_albums << music_album
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
    sleep(1)
    puts
  end

  def add_game
    puts 'Is it a multiplayer game? [Y/N]: '
    multiplayer = gets.chomp.downcase
    puts 'Last played at (yyyy-mm-dd): '
    last_played_at = gets.chomp
    puts 'Publish date (yyyy-mm-dd): '
    publish_date = gets.chomp
    puts 'Is the game archived? (Y/N): '
    archived_str = gets.chomp
    archived = %w[Y YES].include?(archived_str.upcase)

    game = Game.new(multiplayer, last_played_at, publish_date, archived)
    @games.push(game)

    puts 'Author first name: '
    first_name = gets.chomp
    puts 'Author last name: '
    last_name = gets.chomp
    author = Author.new(first_name, last_name)

    author.add_item(game)
    @authors << author
    puts 'Game added successfully'
  end

  def list_games
    if @games.empty?
      puts 'Game not found'
    else
      @games.each do |game|
        puts "
        Multiplayer: #{game.multiplayer == 'y' ? 'Yes' : 'No'},
        Game last played at: #{game.last_played_at},
        Published on: #{game.publish_date}
        "
      end
    end
  end

  def list_authors
    if @author.empty?
      puts 'No author available'
    else
      @authors.each_with_index do |first_name, last_name|
        puts "#{index} Author Name: #{first_name} Last Name: #{last_name}"
      end
    end
  end
end
