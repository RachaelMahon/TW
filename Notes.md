Instructions for Use



Assumptions

I assume the user is a professional rover operator and is aware of what type of input is valid. As such I haven't implemented error checking in their input in terms of format

Both rovers may land at the same time but should not be moving at the same time.

Error messages have been added for interacting with the programs in the repl outside of Rover_Mission.rb

Intended for code to be readable at a glance rather than elegant in some places - ie. the move and swivel functions



Further Development

I would add further prompts in Rover_Mission.rb so that the
user can continue controlling the rover in the terminal, not
just through the Instructions.txt as a one time thing

I would DRY up the swivel_left and swivel_right into one method but right now it is more readable this way

I would give the user an option of getting each rover to split the plateau in two and visit ever coordinate, one each, until the entire terrain was covered

I would also add data validation on the input when it is first loaded.

I would also prevent the rovers from colliding by being directed to the same square - currently they just collide

I would format the output in the terminal so that it is prettier
