require_relative '../ruby/game'

describe Game do
  before :each do
    @game = Game.new(true, '2020-10-11', '2022-10-13', false)
  end

  it 'should be the instance of class' do
    expect(@game).to be_instance_of Game
  end

  it 'check if the game can be archived' do
    can_be_archived = @game.send(:can_be_archived?)
    expect(can_be_archived).to be false
  end
end
