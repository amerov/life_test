require 'spec_helper'

describe Field do
  let(:field) { Field.new(width: 10, height: 15) }

  it 'should be respond_to' do
    expect(field).to respond_to :alive?
    expect(field).to respond_to :alive!
    expect(field).to respond_to :dead!
    expect(field).to respond_to :items
  end

  describe '#items' do
    it 'should be two-dementional array' do
      expect(field.items).to eql(Array.new(15) { Array.new(10) { false } })
    end
  end

  describe '#alive?' do
    before do
      field.alive!(0, 0)
      field.alive!(0, 1)
      field.alive!(9, 14)
    end

    it 'should be report whether the specified cell is alive' do
      expect(field.alive?(0, 1)).to be_truthy
    end

    context 'x or y coordinates are outside the field boundaries' do
      it 'should be wrapped toroidally' do
        expect(field.alive?(-1, -1)).to be_truthy
      end
    end
  end

  describe '#next' do
    context 'current state is dead' do
      context 'exactly 3 neighbors' do
        before do
          field.alive!(0, 0)
          field.alive!(0, 1)
          field.alive!(0, 2)
        end

        it 'should be alive' do
          expect(field.next(1, 1)).to be_truthy
        end
      end

      context 'exactly 2 neighbors' do
        before do
          field.alive!(0, 0)
          field.alive!(0, 1)
          field.dead!(1, 1)
        end

        it 'should be maintain current state' do
          expect(field.next(1, 1)).to be_falsey
        end
      end
    end

    context 'current state is alive' do
      before do
        field.alive!(0, 0)
        field.alive!(0, 1)
        field.alive!(1, 1)
      end

      context 'exactly 2 neighbors' do
        it 'should be maintain current state' do
          expect(field.next(1, 1)).to be_truthy
        end
      end

      context 'exactly 3 neighbors' do
        before do
          field.alive!(2, 0)
        end
        it 'should be dead' do
          expect(field.next(1, 0)).to be_falsey
        end
      end
    end
  end
end

