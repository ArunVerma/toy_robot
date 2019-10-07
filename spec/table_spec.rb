require 'rspec'
require 'spec_helper'
require './lib/table'

describe Table do
  describe '#initialize' do
    it 'have an x attribute which is a Range' do
      object = Table.new
      expect(object.x).to be_a Range
      expect(object.x).to eq 0..4
    end

    it 'have a y attribute which is a Range' do
      object = Table.new
      expect(object.y).to be_a Range
      expect(object.y).to eq 0..4
    end
  end

  describe '#valid_position?' do
    it 'return true when x and y attributes are valid' do
      object = Table.new
      position = Position.new(0, 0, 'NORTH')
      expect(object.valid_position?(position)).to be true
    end

    it 'return false when x and y attributes are too big' do
      object = Table.new
      position = Position.new(6, 6, 'NORTH')
      expect(object.valid_position?(position)).to be false
    end

    it 'return false when x attribute is too big' do
      object = Table.new
      position = Position.new(6, 0, 'NORTH')
      expect(object.valid_position?(position)).to be false
    end

    it 'return false when y attribute is too big' do
      object = Table.new
      position = Position.new(0, 6, 'NORTH')
      expect(object.valid_position?(position)).to be false
    end

    it 'return false when x and y attributes are negative' do
      object = Table.new
      position = Position.new(-1, -1, 'NORTH')
      expect(object.valid_position?(position)).to be false
    end

    it 'return false when x attribute is negative' do
      object = Table.new
      position = Position.new(-2, 0, 'NORTH')
      expect(object.valid_position?(position)).to be false
    end

    it 'return false when y attribute is negative' do
      object = Table.new
      position = Position.new(0, -2, 'NORTH')
      expect(object.valid_position?(position)).to be false
    end
  end
end
