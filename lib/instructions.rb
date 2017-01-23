class Instructions

  attr_reader :plateau_params,:rover_a_params, :rover_b_params,
                :rover_a_instructions, :rover_b_instructions,
                :instructions_array, :instructions

  def initialize
    @instructions = File.read('./lib/instructions.txt')
    @formatted_instructions_array = []
  end

  def create_parameters_from_input
    split_input
    strip_last_paragraph
    assign_parameters_from_input
  end

  def split_input
    @instructions_array = @instructions.split(/\n\n/)
  end

  def strip_last_paragraph
    last_line = @instructions_array.pop
    last_line.gsub!("\n","")
    @instructions_array.push(last_line)
  end

  def format_plateau_coordinates(string)
    formatted = string.split(" ")
    x = formatted[0].to_i
    y = formatted[1].to_i
    [x, y]
  end

  def format_rover_coordinates(string)
    formatted = string.split(" ")
    x = formatted[0].to_i
    y = formatted[1].to_i
    z = formatted[2].to_s
    [x, y, z]
  end

  def format_rover_direction(string)
    formatted = string.split("")
  end

  def assign_parameters_from_input
    @plateau_params = format_plateau_coordinates(@instructions_array[0])
    @rover_a_params = format_rover_coordinates(@instructions_array[1])
    @rover_a_instructions = format_rover_direction(@instructions_array[2])
    @rover_b_params = format_rover_coordinates(@instructions_array[3])
    @rover_b_instructions = format_rover_direction(@instructions_array[4])
  end

  def format_loop(string)
    new_array = []
    string_to_array = string.split("")
    new_array.each do |character|
      if character =~ /[[:alpha:]]/
        new_character = character.to_s
      elsif character =~ /[[:digit:]]/
        new_character = character.to_i
      end
        new_array << new_character
      end
    @formatted_instructions_array << new_array
  end

end
