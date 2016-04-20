require 'spec_helper'

describe Field do
  let(:field) { Field.new(width: 10, height: 15) }

  it 'should be respond_to' do
    expect(field).to respond_to :alive?
    expect(field).to respond_to :set
    expect(field).to respond_to :items
  end

  describe '#items' do
    it 'should be two-dementional array' do
      expect(field.items).to eql(Array.new(10, Array.new(15)))
    end
  end

  describe '#alive?' do
    before do
      field.set(1, 0, true)
      field.set(1, 1, true)
      field.set(9, 14, true)
    end

    it 'should be report whether the specified cell is alive' do
      expect(field.alive?(1, 0)).to be_truthy
    end

    context 'x or y coordinates are outside the field boundaries' do
      it 'should be wrapped toroidally' do
        expect(field.alive?(-1, -1)).to be_truthy
      end
    end
  end
end

