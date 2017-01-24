#Instructions for Use#

Hi there, and welcome to the Rover Mission. To run the mission, run this command in the terminal:

"ruby Rover_Mission_Control.rb"

If you wish to change the input the rovers receive, go to instructions.txt and maintain the same format. The first line is size of the plateau and then all lines after are two lines relating to the spawn location and then instructions of the rover.


##Assumptions##

I assume the user is a professional rover operator and is aware of what type of input is valid. As such I haven't implemented much error checking in their input in terms of format when it first comes in from txt. There is some error checking by the rover itself.

All rovers may land at the same time but should not be moving at the same time.

There may be any number of rovers but there is only one plateau for them to explore with this mission.

Each rover receives a programmed input and performs the input once and then the mission is over

Error messages have been added for interacting with the programs in the repl outside of Rover_Mission.rb where they are not used in the main program

I aimed for the code to be extendable and readable


##Further Development##

I would change the programs start point so that a file could be handed in rather than a hardcoded file name

Make the program extendable for multiple plateaus

I would add further prompts in Rover_Mission.rb so that the
user can continue controlling the rovers in the terminal, not
just through the Instructions.txt as a one time thing

I would DRY up the tests

I would give the user an option of getting each rover to split the plateau in two and visit ever coordinate, one each, until the entire terrain was covered

I would add data validation on the input when it is first loaded

I would clean up the number of instance variables being used - particularly in instructions 

I would prevent the rovers from colliding by being directed to the same square - currently they just ignore this

I would format the output in the terminal so that it is prettier and make it more conversational with delays on the output
