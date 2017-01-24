require 'spec_helper'
require './lib/instructions'

describe Instructions do

  subject(:instructions) {described_class.new('./lib/instructions.txt')}

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
      expect(subject.instructions_array.length).to eq 11
      expect(subject.plateau_params).to eq [5, 5]
      expect(subject.plateau_params).to be_a_kind_of(Array)
      expect(subject.plateau_params.length).to eq 2
    end
  end

  context '#create_rover_spawn_and_instructions_arrays' do
    it 'separate spawning location from end location directions' do
      subject.create_rover_spawn_and_instructions_arrays
      expect(subject.rover_spawn_params).to be_a_kind_of(Array)
      expect(subject.rover_spawn_params).to eq 5
      expect(subject.rover_instructions).to be_a_kind_of(Array)
      expect(subject.rover_spawn_params).to eq 5
    end
  end

  context '#instructions_to_array' do
    it 'change string to array' do
      subject = described_class.new('./lib/instructions.txt')
      subject.instructions_to_array
      expect(subject.instructions_array.length).to eq 5
      expect(subject.instructions_array).to be_a_kind_of(Array)
    end
  end

  context '#strip_last_paragraph' do
    it 'remove any extra paragraphs at bottom of instructions' do
      subject.strip_last_paragraph
      expect(subject.instructions_array.length).to eq 5
      expect(subject.instructions_array).to be_a_kind_of(Array)
    end
  end

  context '#remove_spaces' do
    it 'remove spaces in array elements' do
      subject = described_class.new('./lib/instructions.txt')
      subject.remove_spaces
      expect(subject.instructions_array.length).to eq 5
      expect(subject.instructions_array).to be_a_kind_of(Array)
    end
  end

  context '#format_instructions' do
    it 'format instructions for ground control' do
      subject.format_instructions
      expect(subject.instructions_array.length).to eq 5
      expect(subject.instructions_array).to be_a_kind_of(Array)
    end
  end

  context '#format_loop' do
    it 'formats plateau parameters' do
      expect(subject.format_loop("AB125")).to eq ["A", "B", 1, 2, 5]
      expect(subject.format_loop("AB125")).to be_a_kind_of(Array)
    end
  end

  context '#create_arrays_of_parameters_and_instructions' do
    it 'formats plateau parameters' do
      subject.create_arrays_of_parameters_and_instructions
      expect(subject.instructions_array.length).to eq 5
      expect(subject.instructions_array).to be_a_kind_of(Array)
    end
  end
end
