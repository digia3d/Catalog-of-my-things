require_relative '../ruby/item'
require_relative '../ruby/author'

describe Author do
  before :each do
    @author = Author.new 'Aleksandra', 'Ujvari'
  end

  context 'should create a new author' do
    it 'takes two parameters for the author' do
      @author.should be_an_instance_of Author
    end

    it 'should return the author first_name' do
      @author.first_name.should == 'Aleksandra'
    end

    it 'should return the author last_name' do
      @author.last_name.should == 'Ujvari'
    end
  end
end
