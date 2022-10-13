require_relative '../ruby/item'
require_relative '../ruby/author'

describe Author do
  before :each do
    @author = Author.new 'Aleksandra', 'Ujvari'
  end

  context 'should create a new author' do
    it 'takes two parameters for the author' do
      expect(@author).to be_an_instance_of Author
    end

    it 'should return the author first_name' do
      expect(@author.first_name).to eq 'Aleksandra'
    end

    it 'should return the author last_name' do
      expect(@author.last_name).to eq 'Ujvari'
    end
  end
end
