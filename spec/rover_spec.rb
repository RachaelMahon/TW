require 'spec_helper'
require './lib/rover'

describe Rover do

  subject(:rover) {described_class.new(1,1,3,"N")}

  context '#initialise new rover' do
    it 'is initialised with given x and y coordinates and orientation' do
      expect(rover.id).to eq 1
      expect(rover.x_position).to eq 1
      expect(rover.y_position).to eq 3
      expect(rover.orientation).to eq "N"
    end
  end

  context '#move' do
    it 'can move forward one square at a time in the direction it is facing' do
      rover.move
      expect(rover.x_position).to eq 1
      expect(rover.y_position).to eq 4
    end
  end

  context '#change_orientation' do

    it 'can swivel left' do
      rover.swivel("L")
      expect(rover.orientation).to eq "W"
    end

    it 'can swivel right' do
      rover.swivel("R")
      expect(rover.orientation).to eq "E"
    end
  end

  context '#declare position and orientation' do
    it 'can declare it\'s position and orientation ' do
      expect(rover.declare_position_and_orientation).to eq "1, 3, facing N"
    end
  end

  context '#apply input' do
    it 'can interpret individual letters and has predictable output' do
      input = ["L", "M", "L", "M", "L", "M", "L", "M", "M"]
      input.each do |input|
        rover.apply_input_to_rover(input)
      end
      expect(rover.declare_position_and_orientation).to eq "1, 4, facing N"
    end

    it 'not accept invalid input' do
      expect{rover.apply_input_to_rover("F")}.to raise_error("Instructions terminated at point of invalid character")
    end
  end

  context '#status setters' do
    it 'has a default of not lost' do
      expect(rover.status).to eq "Not lost"
    end

    it 'can get lost' do
      rover.set_rover_status
      expect(rover.status).to eq "Lost"
    end

    it 'has a default of not moved' do
      expect(rover.moved).to eq false
    end

    it 'has a moved status' do
      rover.set_moved_status
      expect(rover.moved).to eq true
    end
  end

end
