require 'spec_helper'
require './lib/ground_control'

describe Ground_Control do

  subject(:ground_control) {described_class.new}

  context '#start mission' do
    it 'can create mission resources, rovers, plateau and instructions' do
      subject.create_mission_resources
      expect(subject.current_rovers).to be_a_kind_of(Array)
      expect(subject.current_rovers[0]).to be_a_kind_of(Rover)
      expect(subject.current_rovers.length).to eq 5
      expect(subject.plateau).to be_a_kind_of(Plateau)
      expect(subject.instructions).to be_a_kind_of(Instructions)
    end
  end

  context '#passing instructions to rovers' do
    it 'can instruction rovers to move' do
      subject.create_mission_resources
      subject.navigate_rovers
      expect(subject.current_rovers[0].declare_position_and_orientation).to eq "1, 3, facing N"
    end
  end

  context '#sending instructions' do
    it 'communicate with rover' do
      response = "string"
      subject.create_mission_resources
      subject.send_instructions_to_rover(subject.current_rovers[0], ["M","M","R","L","M"], 1)
      expect(subject.current_rovers[0].declare_position_and_orientation).to eq "1, 5, facing N"
    end

    it 'doesn\'t move lost rovers' do
      response = "string"
      subject.create_mission_resources
      subject.send_instructions_to_rover(subject.current_rovers[0], ["M","M","M","M","M","M","M","M"], 1)
      expect(subject.current_rovers[0].declare_position_and_orientation).to eq "1, 6, facing N"
    end
  end

  context '#lost rovers' do
    it 'can determine if a rover is lost' do
      subject.create_mission_resources
      subject.send_instructions_to_rover(subject.current_rovers[0], ["M","M","M","M","M","M","M","M"], 1)
      expect(subject.current_rovers[0].status).to eq "Lost"
    end
  end
end
