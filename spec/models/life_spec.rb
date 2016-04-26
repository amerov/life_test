require 'spec_helper'

describe Life do
  let(:life) { Life.new(width: 10, height: 15) }

  it "should be stores the state of a round of Conway's Game of Life" do
    expect(life).to respond_to :prev
    expect(life).to respond_to :next
  end

  describe '#step' do
    it 'should be advances the game by one instant, recomputing and updating all cells' do
      expect(life).to respond_to :step
    end
  end

end
