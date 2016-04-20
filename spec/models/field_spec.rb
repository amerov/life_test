require 'spec_helper'

describe Field do
  let(:field) { Field.new(width: 10, height: 15) }

  it 'should be respond_to' do
    expect(field).to respond_to :alive?
    expect(field).to respond_to :set
    expect(field).to respond_to :items
  end
end
