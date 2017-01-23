require 'spec_helper'
require './lib/ground_control'

describe Ground_Control do

  subject(:ground_control) {described_class.new}

  context '#start mission' do

    it 'can land rovers' do
      ground_control.create_mission_resources
      expect(ground_control.rover_a).to be_a_kind_of(Rover)
      expect(ground_control.rover_b).to be_a_kind_of(Rover)
      expect(ground_control.plateau).to be_a_kind_of(Plateau)
      expect(ground_control.instructions).to be_a_kind_of(Instructions)
    end
  end

  context '#passing instructions to rovers' do
    it 'can start the mission and instruction rovers to move' do
      ground_control.start_mission
      expect(ground_control.rover_a.declare_position_and_orientation).to eq "1, 3, facing N"
    end
  end

end
