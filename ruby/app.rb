require 'date'
require 'fileutils'
require_relative 'book'
require_relative 'music_album'
require_relative 'genre'
require_relative 'game'
require_relative 'author'
require_relative 'movie'
require_relative 'source'
require_relative 'actions/movie'
require_relative 'actions/sources'
require_relative 'actions/music_album_actions'
require_relative 'actions/genre_actions'
require_relative 'actions/book_actions'
require_relative 'actions/label_actions'
require_relative 'actions/game_action'
require_relative 'actions/author_action'

class App
  attr_reader :music_albums, :genres

  def initialize
    @books = []
    @labels = []
    @music_albums = []
    @genres = []
    @games = []
    @authors = []
    @movies = []
    @sources = []
  end

  def start
    FileUtils.mkdir_p('./data')
    @movies = read_movies
    @sources = read_sources
    @books = load_books
    @labels = load_labels
    @music_albums = read_music_albums
    @genres = read_genres
    @games = load_games
    @authors = load_authors
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

    print "\n Book Created Successfully 🎉 \n"
    book = Book.new(publisher, cover_state, publish_date, archived)
    @books << book

    print "\nWould you like to add a label? (Y/N): "
    answer_label = gets.chomp
    if %w[Y YES].include?(answer_label.upcase)
      print 'Title: '
      title = gets.chomp
      print 'Color: '
      color = gets.chomp

      print "\n Label Created Successfully 🎉 \n"
      label = Label.new(title, color)
      @labels << label
    else
      print "\n"
    end
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
    # add on-spotify status
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

    # add genre
    puts 'Enter genre name: '
    genre_name = gets.chomp
    genre = Genre.new(genre_name)
    @genres << genre unless @genres.include?(genre)

    # add year of publication
    puts 'Enter publication date (yyyy-mm-dd):'
    date = gets.chomp

    # add archived status
    puts 'Is it archived? [Y/N]:'
    archived_str = gets.chomp
    archived = %w[Y YES].include?(archived_str.upcase)

    # create new music album
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
      puts "Genres (#{@genres.length}) ⬎ "
      @genres.each_with_index do |genre, index|
        puts "#{index + 1}). #{genre.name}"
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
    multiplayer_str = gets.chomp.upcase
    multiplayer = %w[Y YES].include?(multiplayer_str)
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
        Multiplayer: #{game.multiplayer ? 'Yes' : 'No'},
        Game last played at: #{game.last_played_at},
        Published on: #{game.publish_date}
        "
      end
    end
  end

  def list_authors
    if @authors.empty?
      puts 'No author available'
    else
      @authors.each_with_index do |author, index|
        puts "#{index}) First Name: #{author.first_name} Last Name: #{author.last_name}"
      end
    end
  end

  def add_movie
    print 'Is the movie silent? Y or N: '
    silent = gets.chomp.upcase
    case silent
    when 'Y'
      silent = true
    when 'N'
      silent = false
    else
      puts 'Oooops!!! Invalid response. Please try again...'
      return
    end
    print 'Which day was it published? (yyyy-mm-dd): '
    date_response = gets.chomp
    movie = Movie.new(silent, date_response)
    @movies << movie

    print 'Give the source of the movie: '
    source_response = gets.chomp
    source = Source.new(source_response)
    source.add_item(movie)
    @sources << source

    puts 'Movie created successfully'
  end

  def list_movies
    print "Movies (#{@movies.length}) ⬎ "
    print "\n currently no Movies here" if @movies.empty?
    @movies.each do |movie|
      print "\n Silent: #{movie.silent} || Published date: #{movie.publish_date}"
    end

    print "\n"
  end

  def list_sources
    print "Sources (#{@sources.length}) ⬎ "
    print "\n Currently, the source is empty" if @sources.empty?
    @sources.each_with_index do |source, ind|
      print "\n #{ind + 1} name: #{source.name}"
    end

    print "\n"
  end

  def leave
    write_movies(@movies)
    write_sources(@sources)
    write_music_albums(@music_albums)
    write_genres(@genres)
    write_books(@books)
    write_labels(@labels)
    write_games(@games)
    write_authors(@authors)
  end
end
