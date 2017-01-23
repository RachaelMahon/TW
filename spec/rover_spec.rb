require 'spec_helper'
require './lib/rover'

describe Rover do

  context '#initialise new rover' do
    it 'is initialised with given x and y coordinates and orientation' do
      rover = described_class.new(1,3,"N")
      expect(rover.x_position).to eq 1
      expect(rover.y_position).to eq 3
      expect(rover.orientation).to eq "N"
    end
  end

  context '#move' do
    it 'can move with predictable output' do
      rover = described_class.new(1,3,"N")
      rover.move
      expect(rover.x_position).to eq 1
      expect(rover.y_position).to eq 4
    end
  end

  context '#change_orientation' do

    it 'can swivel left' do
      rover = described_class.new(1,3,"N")
      rover.swivel_left
      expect(rover.orientation).to eq "W"
    end

    it 'can swivel right' do
      rover = described_class.new(1,3,"N")
      rover.swivel_right
      expect(rover.orientation).to eq "E"
    end
  end

  context '#declare position and orientation' do
    it 'can declare it\'s position and orientation ' do
      rover = described_class.new(1,3,"N")
      expect(rover.declare_position_and_orientation).to eq "1, 3, facing N"
    end
  end

  context '#apply input' do
    it 'can interpret individual letters' do
      rover = described_class.new(1,3,"N")
      input = ["L", "M", "L", "M", "L", "M", "L", "M", "M"]
      rover.apply_input_to_rover(input)
      expect(rover.declare_position_and_orientation).to eq "1, 4, facing N"
    end
  end

end
