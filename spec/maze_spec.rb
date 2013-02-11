require 'spec_helper'

describe Maze do

    def given_a_simple_8_x_3_maze
        @maze = Maze::Maze.new('********\n' +
                               '        \n' +
                               '********\n'
                              )

    end

    it 'should have a width of 8' do
        given_a_simple_8_x_3_maze
        @maze.width.should eq 8
    end

    it 'should have a height of 3' do
        given_a_simple_8_x_3_maze
        @maze.height.should eq 3
    end

    it 'should be possible to visit an empty space' do
        given_a_simple_8_x_3_maze
        @maze.visitable?(0, 1).should be_true
    end

end

