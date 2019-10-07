require 'rspec'
require 'spec_helper'
require './lib/handle_input'

describe HandleInput do
  describe '#initialize' do
    it 'have a robot attribute which is an object of Robot' do
      object = HandleInput.new(Robot.new, Table.new, Action.new)
      expect(object.robot).to be_a Robot
    end

    it 'have a table attribute which is an object of Table' do
      object = HandleInput.new(Robot.new, Table.new, Action.new)
      expect(object.table).to be_a Table
    end

    it 'have an action attribute which is an object of Action' do
      object = HandleInput.new(Robot.new, Table.new, Action.new)
      expect(object.action).to be_a Action
    end
  end

  describe '#interpret' do
    it 'return an object of Position when command matches PLACE pattern' do
      object = HandleInput.new(Robot.new, Table.new, Action.new)
      command = 'PLACE 1,2,NORTH'
      expect(object.interpret(command)).to be_a Position
    end

    it 'return nil when robot is not in place' do
      object = HandleInput.new(Robot.new, Table.new, Action.new)
      command = ''
      expect(object.interpret(command)).to be_nil
    end

    it 'return an object of Position when command matches MOVE pattern' do
      object = HandleInput.new(Robot.new, Table.new, Action.new)
      command1 = 'PLACE 1,2,NORTH'
      command2 = 'MOVE'
      object.interpret(command1)
      expect(object.interpret(command2)).to be_a Position
    end

    it 'return an object of Position when command matches LEFT pattern' do
      object = HandleInput.new(Robot.new, Table.new, Action.new)
      command1 = 'PLACE 1,2,NORTH'
      command2 = 'LEFT'
      object.interpret(command1)
      expect(object.interpret(command2)).to be_a Position
    end

    it 'return an object of Position when command matches RIGHT pattern' do
      object = HandleInput.new(Robot.new, Table.new, Action.new)
      command1 = 'PLACE 1,2,NORTH'
      command2 = 'RIGHT'
      object.interpret(command1)
      expect(object.interpret(command2)).to be_a Position
    end

    it 'return an object of Position when command matches REPORT pattern' do
      object = HandleInput.new(Robot.new, Table.new, Action.new)
      command1 = 'PLACE 1,2,NORTH'
      command2 = 'REPORT'
      object.interpret(command1)
      expect(object.interpret(command2)).to be_a Position
    end
  end

  describe '#next_position' do
    it 'return an object of Position' do
      object = HandleInput.new(Robot.new, Table.new, Action.new)
      position = Position.new(0, 0, 'NORTH')
      command = 'MOVE'
      expect(object.send(:next_position, position, command)).to be_a Position
    end
  end

  describe '#exec' do
    it 'return an object of Position' do
      object = HandleInput.new(Robot.new, Table.new, Action.new)
      position = Position.new(0, 0, 'NORTH')
      expect(object.send(:exec, position)).to be_a Position
    end

    it 'return nil if position is not a valid table position' do
      object = HandleInput.new(Robot.new, Table.new, Action.new)
      position = Position.new(0, 6, 'NORTH')
      expect(object.send(:exec, position)).to be_nil
    end
  end
end