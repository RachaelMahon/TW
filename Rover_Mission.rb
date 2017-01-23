require_relative './lib/ground_control'



puts "Welcome to the Mars Rover Mission"
puts ""
puts "We are loading your instructions from instructions.txt"
mission = Ground_Control.new
mission.create_mission_resources
# sleep(1)
puts ""
puts "Your plateau is a rectangle with outermost coordinates of #{mission.instructions.plateau_params[0]}, #{mission.instructions.plateau_params[1]}"
# sleep(1)
puts ""
# sleep(1)
puts "Your first rover has landed at:"
puts "#{mission.rover_a.declare_position_and_orientation}"
puts ""
# sleep(1)
puts "Your second Rover has landed at"
puts "#{mission.rover_b.declare_position_and_orientation}"
puts ""
# sleep(1)
puts "Your instructions are being passed to your first Rover"
puts ""
# sleep(1)
puts "Your instructions to your first Rover are #{mission.instructions.rover_a_instructions}"
# sleep(1)
mission.send_instructions_to_rover(mission.rover_a, mission.instructions.rover_a_instructions)
puts "You have instructed your first Rover to move to"
puts "#{mission.rover_a.declare_position_and_orientation}"
# sleep(1)
puts ""
# sleep(1)
puts "Your instructions are being passed to your second Rover"
puts ""
puts "Your instructions to your second Rover are #{mission.instructions.rover_b_instructions}"
puts "You have instructed your second Rover to move to"
mission.send_instructions_to_rover(mission.rover_b, mission.instructions.rover_b_instructions)
puts "#{mission.rover_b.declare_position_and_orientation}"
