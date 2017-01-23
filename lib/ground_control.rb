require_relative './plateau'
require_relative './rover'
require_relative './instructions'

class Ground_Control

  attr_accessor :rover_a, :rover_b, :plateau, :instructions, :rover_a_instructions

# Begin mission by creating resources

  def create_mission_resources
    get_instructions
    land_rovers
    map_plateau
  end

  def get_instructions
    @instructions = Instructions.new
    @instructions.create_parameters_from_input
  end

  def map_plateau
    @plateau = Plateau.new(*@instructions.plateau_params)
  end

  def land_rovers
    @rover_a = Rover.new(*@instructions.rover_a_params)
    @rover_b = Rover.new(*@instructions.rover_b_params)
  end

  # Handling input

  def send_instructions_to_rover(rover, instructions)
    instructions.each do |letter|
      rover_lost(rover)
      rover_collision_checker(rover)
      if rover.status == "Lost"
        puts "Your rover has fallen off the plateau - it was last seen at #{rover.declare_position_and_orientation}"
        break
      elsif rover.collided == "Collided"
        puts "Your rovers have collided at #{rover.declare_position_and_orientation}"
        exit
      else
        rover.apply_input_to_rover(letter)
        puts "Your rover is at #{rover.declare_position_and_orientation}"
        sleep(0.1)
      end
    end
  end

  # Handling edge cases

  def rover_lost(rover)
    if rover.x_position > @plateau.max_x || rover.x_position < 0
      rover.set_rover_status
    elsif rover.y_position > @plateau.max_y || rover.y_position < 0
      rover.set_rover_status
    end
  end

  def rover_collision_checker(rover)
    if @rover_a.x_position == @rover_b.x_position && @rover_a.y_position == @rover_b.y_position
      rover.set_collision_status
    end
  end
  
end
