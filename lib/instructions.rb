class Instructions

  attr_reader :plateau_params, :rover_spawn_params, :rover_instructions,
              :load_instructions_from_file, :instructions_array

  def initialize(file)
    @load_instructions_from_file = File.read(file)
  end

  # Method to undertake all work carried out by Instructions class
  # required to inform the rest of the program

  def create_parameters_from_input
    process_instructions
    separate_plateau_from_rovers
    create_rover_spawn_and_instructions_arrays
  end

  # Preliminary processing of instructions to work with

  def process_instructions
    instructions_to_array
    remove_spaces
    strip_last_paragraph
  end

  # Creating the plateau parameters instance variable and separating
  # it from the details that the rovers needs to know

  def separate_plateau_from_rovers
    get_plateau_parameter
    remove_plateau_details_from_array
  end

  # Format the spawn coordinates and directions for the rovers before
  # splitting

  def create_rover_spawn_and_instructions_arrays
    format_instructions
    create_arrays_of_parameters_and_instructions
  end

  # Process instructions methods

    def instructions_to_array
      @instructions_array = @load_instructions_from_file.split(/\n\n/)
    end

    def strip_last_paragraph
      last_line = @instructions_array.pop
      last_line.gsub!("\n","")
      @instructions_array.push(last_line)
    end

    def remove_spaces
      @instructions_array.each do |element|
        element.gsub!(" ","")
      end
    end

    # Separate plateau from rover

    def get_plateau_parameter
      @plateau_params = @instructions_array[0].split("").map(&:to_i)
    end

    def remove_plateau_details_from_array
      @instructions_array.shift
    end

# Create rover spawn & instructions arrays methods
  def format_instructions
    @array_of_instructions_arrays = []
    @instructions_array.each do |element|
      element_to_array = format_loop(element)
      @array_of_instructions_arrays << element_to_array
    end
  end

  def format_loop(string)
    new_array = []
    string_to_array = string.split("")
    string_to_array.each do |character|
      if character =~ /[[:alpha:]]/
        new_character = character.to_s
        new_array << new_character
      elsif character =~ /[[:digit:]]/
        new_character = character.to_i
        new_array << new_character
      end
    end
    new_array
  end

  def create_arrays_of_parameters_and_instructions
    @rover_spawn_params = []
    @rover_instructions = []
    @array_of_instructions_arrays.each_with_index do |element, index|
      if index % 2 == 0
        @rover_spawn_params << element
      elsif index % 2 != 0
        @rover_instructions << element
      end
    end
  end
end
