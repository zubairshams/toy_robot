class CommandParser
  def initialize(robot)
    @robot = robot
    @methods = robot.public_methods(false)
  end

  def execute(input)
    command, args = input.split(' ')
    method = command.downcase.to_sym

    if @methods.include?(method)
      if method == :place
        x, y, f = args.split(',') if args
        @robot.send(method, x, y, f)
      else
        @robot.send(method)
      end
    else
      puts "Invalid command: #{command}"
    end
  end
end

