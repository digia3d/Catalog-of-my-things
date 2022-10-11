require_relative '../ruby/label'
require_relative '../ruby/item'

describe Label do
  before(:each) do
    @label = Label.new('dangerous', 'red')
  end

  context '#new' do
    it 'should initialize' do
      expect(@label).to be_an_instance_of Label
    end

    it 'should assign right properties' do
      expect(@label).to have_attributes(
        title: 'dangerous',
        color: 'red',
      )
    end
  end

  context '#add_item' do
    before(:each) do
      @book_mock = double('Book')
      allow(@book_mock).to receive(:label) { @label }
    end

    it 'adds self as label property' do
      # expect label to be assigned
      expect(@book_mock).to receive(:label=)

      @label.add_item(@book_mock)

      # check if assigned label is correct
      expect(@book_mock.label).to eq @label
    end
  end
end