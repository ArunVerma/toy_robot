require 'rspec'
require 'spec_helper'
require './lib/robot'

describe Robot do
  describe '#initialize' do
    it 'have a current_position attribute which is nil' do
      object = Robot.new
      expect(object.position).to be_nil
    end
  end

  describe '#update_robot' do
    it 'return an object of Position' do
      object = Robot.new
      new_position = Position.new(0, 1, 'NORTH')
      expect(object.update_robot(new_position)).to be_a Position
    end

    it 'return false if new_position is nil' do
      object = Robot.new
      new_position = nil
      expect(object.update_robot(new_position)).to be_nil
    end
  end

  describe '#not_in_place?' do
    it 'return true if position attribute is nil' do
      object = Robot.new
      expect(object.not_in_place?).to be true
    end
  end
end