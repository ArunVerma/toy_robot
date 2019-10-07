require 'rspec'
require 'spec_helper'
require './lib/action'

describe Action do
  describe '#place' do
    it 'return an object of Position' do
      object = Action.new
      command = 'PLACE 0,0,NORTH'
      expect(object.place(command)).to be_a Position
    end
  end

  describe '#move' do
    it 'return an object of Position' do
      object = Action.new
      position = Position.new(0, 0, 'NORTH')
      expect(object.move(position)).to be_a Position
    end
  end

  describe '#left' do
    it 'return an object of Position' do
      object = Action.new
      position = Position.new(0, 0, 'NORTH')
      expect(object.left(position)).to be_a Position
    end
  end

  describe '#right' do
    it 'return an object of Position' do
      object = Action.new
      position = Position.new(0, 0, 'NORTH')
      expect(object.right(position)).to be_a Position
    end
  end

  describe '#report' do
    it 'return an object of Position' do
      object = Action.new
      position = Position.new(0, 0, 'NORTH')
      expect(object.right(position)).to be_a Position
    end
  end

  describe '#prev_option' do
    it 'return the last value in the OPTIONS array' do
      object = Action.new
      expect(object.send(:prev_option, 'WEST')).to be_a String
      expect(object.send(:prev_option, 'WEST')).to eq 'SOUTH'
    end

    it 'return the previous value in the OPTIONS array' do
      object = Action.new
      expect(object.send(:prev_option, 'NORTH')).to be_a String
      expect(object.send(:prev_option, 'NORTH')).to eq 'WEST'
    end

    it 'return the previous value in the OPTIONS array' do
      object = Action.new

      expect(object.send(:prev_option, 'EAST')).to be_a String
      expect(object.send(:prev_option, 'EAST')).to eq 'NORTH'
    end

    it 'return the previous value in the OPTIONS array' do
      object = Action.new
      expect(object.send(:prev_option, 'SOUTH')).to be_a String
      expect(object.send(:prev_option, 'SOUTH')).to eq 'EAST'
    end

    it 'return nil if the direction param is empty' do
      object = Action.new
      expect(object.send(:prev_option, '')).to be_nil
    end
  end

  describe '#next_option' do
    it 'return the next value in the OPTIONS array' do
      object = Action.new
      expect(object.send(:next_option, 'WEST')).to be_a String
      expect(object.send(:next_option, 'WEST')).to eq 'NORTH'
    end

    it 'return the next value in the OPTIONS array' do
      object = Action.new
      expect(object.send(:next_option, 'NORTH')).to be_a String
      expect(object.send(:next_option, 'NORTH')).to eq 'EAST'
    end

    it 'return the next value in the OPTIONS array' do
      object = Action.new
      expect(object.send(:next_option, 'EAST')).to be_a String
      expect(object.send(:next_option, 'EAST')).to eq 'SOUTH'
    end

    it 'return the first value in the OPTIONS array' do
      object = Action.new
      expect(object.send(:next_option, 'SOUTH')).to be_a String
      expect(object.send(:next_option, 'SOUTH')).to eq 'WEST'
    end

    it 'return nil if the direction param is empty' do
      object = Action.new
      expect(object.send(:next_option, '')).to be_nil
    end
  end
end
