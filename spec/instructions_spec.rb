require 'spec_helper'
require './lib/instructions'

describe Instructions do

  subject(:instructions) {described_class.new('./lib/instructions_test.txt')}

  context '#initialise' do
    it 'is initialised with instructions loaded from a text file' do
      expect(instructions.load_instructions_from_file).to be_a_kind_of(String)
    end
  end

  context '#process_instructions' do
    it 'processes instructions to readable format' do
      subject.process_instructions
      expect(subject.instructions_array.length).to eq 11
      expect(subject.instructions_array).to be_a_kind_of(Array)
    end
  end

context '#separate_plateau_from_rovers' do
    it 'changes the instructions to only relate to the rovers' do
      subject.process_instructions
      subject.separate_plateau_from_rovers
      expect(subject.instructions_array.length).to eq 10
      expect(subject.plateau_params).to eq [5, 5]
      expect(subject.plateau_params).to be_a_kind_of(Array)
      expect(subject.plateau_params.length).to eq 2
    end
  end

  context '#create_rover_spawn_and_instructions_arrays' do
    it 'separate spawning location from end location directions' do
      subject.process_instructions
      subject.separate_plateau_from_rovers
      subject.create_rover_spawn_and_instructions_arrays
      expect(subject.rover_spawn_params).to eq [[1, 2, "N"], [1, 1, "N"], [4, 6, "E"], [2, 1, "W"], [3, 1, "S"]]
      expect(subject.rover_instructions).to eq [["M"], ["M", "M", "M"], ["L", "R", "M", "L", "M", "M", "R", "R", "M"], ["M", "M", "R", "R", "M", "L", "M"], ["M", "R", "R", "M", "L", "R", "M"]]

    end
  end

  context '#instructions_to_array' do
    it 'change string to array' do
      subject.process_instructions
      subject.separate_plateau_from_rovers
      subject.instructions_to_array
      expect(subject.instructions_array.length).to eq 11
      expect(subject.instructions_array).to be_a_kind_of(Array)
    end
  end

  context '#strip_last_paragraph' do
    it 'remove any extra paragraphs at bottom of instructions' do
      subject.process_instructions
      subject.separate_plateau_from_rovers
      subject.instructions_to_array
      subject.strip_last_paragraph
      expect(subject.instructions_array[10]).to eq "MRRMLRM"
      expect(subject.instructions_array[10]).not_to eq "MRRMLRM\n"
    end
  end

  context '#remove_spaces' do
    it 'remove spaces in array elements' do
      subject.process_instructions
      subject.separate_plateau_from_rovers
      subject.remove_spaces
      expect(subject.instructions_array).to eq ["12N", "M", "11N", "MMM", "46E", "LRMLMMRRM", "21W", "MMRRMLM", "31S", "MRRMLRM"]
    end
  end

  context '#format_instructions' do
    it 'format instructions for ground control' do

      subject.process_instructions
      subject.separate_plateau_from_rovers
      subject.remove_spaces
      subject.format_instructions
      expect(subject.array_of_instructions_arrays[3]).to eq ["M", "M", "M"]
      expect(subject.array_of_instructions_arrays[4]).to eq [4, 6, "E"]
    end
  end

  context '#format_loop' do
    it 'formats plateau parameters' do
      expect(subject.format_loop("AB125")).to eq ["A", "B", 1, 2, 5]
      expect(subject.format_loop("AB125")).to be_a_kind_of(Array)
    end
  end
end
