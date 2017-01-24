require_relative './lib/ground_control'



puts "Welcome to the Mars Rover Mission"
puts ""
puts "We are loading your instructions from instructions.txt"
mission = Ground_Control.new
mission.create_mission_resources
mission.navigate_rovers
puts "Your squad have completed their mission"
