Dir[File.dirname(__FILE__) + '/lib/*'].each { |file| require_relative file }

robot = Robot.new
command_parser = CommandParser.new(robot)

puts "Available Commands: PLACE, LEFT, RIGHT, MOVE, REPORT or EXIT"

while input = gets.chomp.strip
  break if input == 'EXIT'
  command_parser.execute(input) unless input.empty?
end
