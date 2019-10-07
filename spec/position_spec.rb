require 'rspec'
require 'spec_helper'
require './lib/position'

describe Position do
  describe '#initialize' do
    it 'have an x attribute which is an integer' do
      object = Position.new(0, 0, 'NORTH')
      expect(object.x).to be_a Integer
      expect(object.x).to be >= 0
      expect(object.x).to be <= 4
    end

    it 'have a y attribute which is an integer' do
      object = Position.new(0, 0, 'NORTH')
      expect(object.y).to be_a Integer
      expect(object.y).to be >= 0
      expect(object.y).to be <= 4
    end

    it 'have a f attribute which is a string' do
      object = Position.new(0, 0, 'NORTH')
      expect(object.f).to be_a String
      expect(object.f).to eq 'NORTH'
    end
  end
end
