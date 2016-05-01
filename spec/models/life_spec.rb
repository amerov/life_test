require 'spec_helper'

describe Life do
  let!(:life) { Life.new(width: 10, height: 15) }

  it "should be stores the state of a round of Conway's Game of Life" do
    expect(life).to respond_to :prev
    expect(life).to respond_to :next
  end

  it 'should be a new Life game state with a random initial state' do
    expect(life.prev).to be_a(Field)
    expect(life.prev).to respond_to :items
    expect(life.prev.items).to_not match_array(Life.new(width: 10, height: 15).prev.items)
    expect(life.prev.items).to_not match_array(Life.new(width: 10, height: 15).prev.items)
    expect(life.prev.items).to_not match_array(Life.new(width: 10, height: 15).prev.items)
  end

  describe '#step' do
    it 'should be advances the game by one instant, recomputing and updating all cells' do
      prev = life.prev.items.dup
      life.step
      expect(prev).to_not match_array(life.next.items)
    end
  end

end
