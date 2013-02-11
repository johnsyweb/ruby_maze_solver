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

    it 'should not be possible to visit a wall' do
        given_a_simple_8_x_3_maze
        @maze.visitable?(0, 0).should be_false
    end

    it 'should not be possible to visit outside the maze' do
        given_a_simple_8_x_3_maze
        @maze.visitable?(8, 3).should be_false
    end

    it 'should not be possible to visit a visited space' do
        given_a_simple_8_x_3_maze
        @maze.visit 0, 1 
        @maze.visitable?(0, 1).should be_false
    end

    it 'should be possible to visit an unvisited space' do
        given_a_simple_8_x_3_maze
        @maze.visit 0, 1 
        @maze.unvisit 0, 1 
        @maze.visitable?(0, 1).should be_true
    end

    it 'should solve a simple maze' do
        given_a_simple_8_x_3_maze
        @maze.solve(0, 1, 7, 1).should be_true
    end

end

