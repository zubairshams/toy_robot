require 'spec_helper'
require 'robot'

RSpec.describe Robot do
  let(:robot) { Robot.new }

  describe '#place' do
    context 'with valid inputs' do
      specify 'places robot on tabletop' do
        robot.place(3, 3, 'EAST')

        expect(robot.send(:placed?)).to be_truthy
        expect(robot.position).to eq(Position.new(3, 3))
        expect(robot.facing).to eq('EAST')
      end
    end

    context 'with invalid inputs' do
      specify 'does not place robot on tabletop' do
        robot.place(6, 6, 'EAST')

        expect(robot.send(:placed?)).to be_falsey
        expect(robot.position).to be_nil
  	  	expect(robot.facing).to be_nil
      end
    end
  end

  describe '#left' do
   specify 'rotates the robot anti clockwise by 90 degree without changing the position' do
     robot.place(0, 0, 'NORTH')
     robot.left

     expect(robot.facing).to eq('WEST')
     expect(robot.position).to eq(Position.new(0, 0))
   end
  end

  describe '#right' do
   specify 'rotates the robot clockwise by 90 degree without changing the position' do
     robot.place(0, 0, 'NORTH')
     robot.right

     expect(robot.facing).to eq('EAST')
     expect(robot.position).to eq(Position.new(0, 0))
   end
  end

  describe '#move' do
    context 'facing north' do
      specify 'move the toy by one unit towards north' do
        robot.place(0, 0, 'NORTH')
        robot.move

        expect(robot.facing).to eq('NORTH')
        expect(robot.position.y).to eq(1)
      end
    end

    context 'facing east' do
      specify 'move the toy by one unit towards east' do
        robot.place(1, 1, 'EAST')
        robot.move

        expect(robot.facing).to eq('EAST')
        expect(robot.position.x).to eq(2)
      end
    end

    context 'facing south' do
      specify 'move the toy by one unit towards south' do
        robot.place(2, 2, 'SOUTH')
        robot.move

        expect(robot.facing).to eq('SOUTH')
        expect(robot.position.y).to eq(1)
      end
    end

    context 'facing west' do
      specify 'move the toy by one unit towards west' do
        robot.place(3, 3, 'WEST')
        robot.move

        expect(robot.facing).to eq('WEST')
        expect(robot.position.x).to eq(2)
      end
    end

    context 'ignore movement' do
      specify 'robot does not fall off table during the movement' do
        robot.place(4, 4, 'EAST')
        robot.move

        expect(robot.facing).to eq('EAST')
        expect(robot.position.x).to eq(4)
        expect(robot.send(:placed?)).to be_truthy
      end
    end
  end

  describe '#report' do
    specify do
      robot.place(1, 1, 'EAST')
        expect { robot.report }.to output("Output: 1,1,EAST\n").to_stdout
    end
  end
end

