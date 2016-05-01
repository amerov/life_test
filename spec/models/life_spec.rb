require 'spec_helper'

describe Life do
  let(:life) { Life.new(width: 10, height: 15) }

  it "should be stores the state of a round of Conway's Game of Life" do
    expect(life).to respond_to :a
    expect(life).to respond_to :b
  end

  it 'should be a new Life game state with a random initial state' do
    expect(life.a).to be_a(Field)
    expect(life.a).to respond_to :items
    expect(life.a.items).to_not match_array(Life.new(width: 10, height: 15).a.items)
    expect(life.a.items).to_not match_array(Life.new(width: 10, height: 15).a.items)
    expect(life.a.items).to_not match_array(Life.new(width: 10, height: 15).a.items)
  end

  describe '#step' do
    it 'should be advances the game by one instant, recomputing and updating all cells' do
      life.step
      expect(life.a.items).to_not match_array(life.b.items)
      expect {life.step}.to change {life.b.items}
    end
  end

end

