require 'spec_helper'

describe Field do
  let(:field) { Field.new(width: 10, height: 15) }

  it 'should be represents a two-dimensional field of cells.' do
    expect(field).to be respond_to :alive?
    expect(field).to be respond_to :make
    expect(field).to be respond_to :items
    expect(field).to be respond_to :set
  end
end
