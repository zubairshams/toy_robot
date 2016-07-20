require 'spec_helper'
require 'robot'
require 'command_parser'

RSpec.describe CommandParser do
  let(:robot) { Robot.new }
  let(:command_parser) { CommandParser.new(robot) }

  describe '#execute' do
    context 'as place' do
      specify 'receives and executes place command' do
        command_parser.execute('PLACE 1,1,NORTH')
        expect(robot.position).not_to be_nil
      end

      specify 'receieve but does not execute place command with missing arguments' do
        command_parser.execute('PLACE NORTH')
        expect(robot.position).to be_nil
      end
    end

    context 'other commands' do
      specify 'receive move command but does not execute prior to place command' do
        command_parser.execute('MOVE')
        expect(robot.position).to be_nil
      end

      specify 'receive and executes move command' do
        command_parser.execute('PLACE 1,1,NORTH')
        command_parser.execute('MOVE')
        expect(robot.position.y).to eq(2)
      end
    end

    context 'invalid commands' do
      specify 'does not receive and prints error message' do
      	expect(robot).not_to receive(:test)
      	expect { command_parser.execute('TEST') }.to output("Invalid command: TEST\n").to_stdout
      end
    end
  end
end
