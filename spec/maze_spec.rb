require "spec_helper"

describe Maze do

    def given_a_simple_8_x_3_maze
        @maze = Maze::Maze.new :from_grid => "********\n" +
            "        \n" +
            "********\n"
    end

    it "should have a width of 8" do
        given_a_simple_8_x_3_maze
        @maze.width.should eq 8
    end

    it "should have a height of 3" do
        given_a_simple_8_x_3_maze
        @maze.height.should eq 3
    end

    it "should be possible to visit an empty space" do
        given_a_simple_8_x_3_maze
        @maze.visitable?(0, 1).should be_true
    end

    it "should not be possible to visit a wall" do
        given_a_simple_8_x_3_maze
        @maze.visitable?(0, 0).should be_false
    end

    it "should not be possible to visit outside the maze" do
        given_a_simple_8_x_3_maze
        @maze.visitable?(8, 3).should be_false
    end

    it "should not be possible to visit a visited space" do
        given_a_simple_8_x_3_maze
        @maze.visit 0, 1
        @maze.visitable?(0, 1).should be_false
    end

    it "should be possible to visit an unvisited space" do
        given_a_simple_8_x_3_maze
        @maze.visit 0, 1
        @maze.unvisit 0, 1
        @maze.visitable?(0, 1).should be_true
    end

    it "should solve a simple maze" do
        given_a_simple_8_x_3_maze
        @maze.solve(0, 1, 7, 1).should be_true
    end

    it "should solve a simple maze backwards" do
        given_a_simple_8_x_3_maze
        @maze.solve(7, 1, 0, 1).should be_true
    end

    it "should solve a bigger maze" do
        maze = Maze::Maze.new :from_grid => "********\n" +
            "  **   *\n" +
            "* ** * *\n" +
            "* *  * *\n" +
            "* ** * *\n" +
            "* **** *\n" +
            "*      *\n" +
            "********\n"
        maze.solve(0, 1, 3, 3).should be_true
    end

    it "should fail an impossible maze" do
        maze = Maze::Maze.new :from_grid => "********\n" +
            "  **   *\n" +
            "* **** *\n" +
            "* *  * *\n" +
            "* ** * *\n" +
            "* **** *\n" +
            "*      *\n" +
            "********\n"
        maze.solve(0, 1, 3, 3).should be_false
    end

    it "should be printable" do
        given_a_simple_8_x_3_maze
        @maze.to_s.should eq "********\n" +
            "        \n" +
            "********"
    end

    it "should be printable when solved" do
        given_a_simple_8_x_3_maze
        @maze.solve 0, 1, 7, 1
        @maze.to_s.should eq "********\n" +
            "++++++++\n" +
            "********"
    end

    it "should be creatable from a file" do
        maze = Maze::Maze::new :from_file => "spec/test.maze"
        maze.solve(18, 0, 12, 6).should be_true
    end

end

