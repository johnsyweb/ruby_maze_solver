require 'spec_helper'

describe Maze do

    it 'should be constructable with a string' do
        maze = Maze::Maze.new '********'
    end

    it 'should have a width of 8' do
        maze = Maze::Maze.new '********'
        maze.width.should eq 8
    end

    it 'should have a height of 3' do
        maze = Maze::Maze.new('********\n' +
                              '        \n' +
                              '********\n'
                             )

        maze.height.should eq 3
    end

    it 'should be possible to visit an empty space' do
        maze = Maze::Maze.new('********\n' +
                              '        \n' +
                              '********\n'
                             )

        maze.visitable?(0, 1).should be_true
    end

end

