require_relative './plateau'
require_relative './rover'
require_relative './instructions'

class Ground_Control

  attr_accessor :rover_a, :rover_b, :plateau, :instructions, :rover_a_instructions,
                :current_rovers

# Begin mission by creating resources

  def create_mission_resources
    get_instructions
    map_plateau
    land_rovers
  end

# Methods for creating resources

  def get_instructions
    @instructions = Instructions.new
    @instructions.create_parameters_from_input
  end

  def map_plateau
    @plateau = Plateau.new(*@instructions.plateau_params)
    puts "Your plateau is #{@plateau.max_x} units wide and #{@plateau.max_y} long"
  end

  def land_rovers
    @current_rovers = []
    i = 1
    @instructions.rover_spawn_params.each do |params_array|
      new_rover = Rover.new(i,*params_array)
      @current_rovers << new_rover
      puts "Rover with id #{i} landed at #{params_array}"
      i = i + 1
    end
  end

  # Handling input

  def navigate_rovers
    @current_rovers.each_with_index do |rover, index|
      next if rover.moved == true
      send_instructions_to_rover(rover, @instructions.rover_instructions[index], index + 1)
    end
  end

  def send_instructions_to_rover(rover, instructions, number)
    instructions.each do |letter|
      rover_lost(rover)
      if rover.status == "Lost"
        puts "Your rover number #{number} has fallen off the plateau - it was last seen at #{rover.declare_position_and_orientation}"
        break
      else
        rover.apply_input_to_rover(letter)
        puts "Your rover number #{number} is at #{rover.declare_position_and_orientation}"
        sleep(0.1)
      end
    end
    rover.set_moved_status
  end

  # Handling edge cases

  def rover_lost(rover)
    if rover.x_position > @plateau.max_x || rover.x_position < 0
      rover.set_rover_status
    elsif rover.y_position > @plateau.max_y || rover.y_position < 0
      rover.set_rover_status
    end
  end

end
