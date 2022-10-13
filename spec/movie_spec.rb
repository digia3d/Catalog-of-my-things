require_relative '../ruby/item'
require_relative '../ruby/movie'
require 'date'

describe Movie do
  before(:each) do
    @movie = Movie.new(true, '2020-01-10')
  end

  context '#new' do
    it 'should initialize' do
      expect(@movie).to be_an_instance_of(Movie)
    end

    it 'should assign right properties' do
      expect(@movie).to have_attributes(
        silent: true,
        publish_date: Date.iso8601('2020-01-10')
      )
    end

    it 'should be a sub-class of Item' do
      expect(@movie.class).to be < Item
    end
  end
end
