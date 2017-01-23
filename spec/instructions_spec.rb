require 'spec_helper'
require './lib/instructions'

describe Instructions do

  context '#initialise' do
    it 'is initialised with instructions loaded from a text file' do
      instructions = described_class.new
      expect(instructions.instructions).to be_a_kind_of(String)
    end
  end

  context '#split_input' do
    it 'changes text file to an array of 5 lines long' do
      instructions = described_class.new
      instructions.split_input
      expect(instructions.instructions_array.length).to eq 5
      expect(instructions.instructions_array).to be_a_kind_of(Array)
    end
  end

  context '#assign_parameters_from_input' do
    it 'splits input and attachs it to different instance variables per lines' do
      instructions = described_class.new
      instructions.create_parameters_from_input
      expect(instructions.plateau_params).to eq [5, 5]
      expect(instructions.rover_a_params).to eq [1, 2, "N"]
      expect(instructions.rover_b_params).to eq [3, 3, "E"]
      expect(instructions.rover_a_instructions).to eq ["L", "M", "L", "M", "L", "M", "L", "M", "M"]
      expect(instructions.rover_b_instructions).to eq ["M", "M", "R", "M", "M", "R", "M", "R", "R", "M"]
    end
  end

end
