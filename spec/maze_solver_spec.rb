# encoding: UTF-8

require 'spec_helper'

describe MazeSolver::MazeSolver do
  context 'a simple 8 x 3 maze' do
    let(:grid) do <<-GRID
********

********
GRID
    end

    subject(:maze) { described_class.new(from_grid: grid) }

    its(:width) { should eq 8 }
    its(:height) { should eq 3 }

    it 'should be possible to visit an empty space' do
      maze.should be_visitable(0, 1)
    end

    it 'should not be possible to visit a wall' do
      maze.should_not be_visitable(0, 0)
    end

    it 'should not be possible to visit outside the maze' do
      maze.should_not be_visitable(8, 3)
    end

    it 'should not be possible to visit a visited space' do
      maze.visit(0, 1)
      maze.should_not be_visitable(0, 1)
    end

    it 'should be possible to visit an unvisited space' do
      maze.visit(0, 1)
      maze.unvisit(0, 1)
      maze.should be_visitable(0, 1)
    end

    it 'should be soluble' do
      maze.solve(0, 1, 7, 1).should be_true
    end

    it 'should be soluble backwards' do
      maze.solve(7, 1, 0, 1).should be_true
    end

    it 'should be printable' do
      maze.to_s.should eq "********\n" +
        "        \n" +
        "********\n"
    end

    it 'should be printable when solved' do
      maze.solve(0, 1, 7, 1)
      maze.to_s.should eq <<-GRID
********
........
********
      GRID
    end

  end

  context 'a bigger maze' do
    let(:grid) do
      <<-GRID
********
  **   *
* ** * *
* *  * *
* ** * *
* **** *
*      *
********
      GRID
    end

    subject(:maze) { described_class.new(from_grid: grid) }

    it 'should be soluble' do
      maze.solve(0, 1, 3, 3).should be_true
    end
  end

  context 'an impossible maze' do
    let(:grid) do
      <<-GRID
********
  **   *
* **** *
* *  * *
* ** * *
* **** *
*      *
********
GRID
    end

    subject(:maze) { described_class.new(from_grid: grid) }
    it 'should be insoluble' do
      maze.solve(0, 1, 3, 3).should be_false
    end
  end

  context 'from file' do
    let(:test_maze) do
      StringIO.new(<<-DOC
****************** *
*     *       **** *
* ***** *****   ** *
* ***** ******* ** *
* *          ** ** *
* ********** **    *
************ *******
                   DOC
                  )
    end
    before { File.stub(:open).with('test.maze', 'r').and_return(test_maze) }

    it 'should be creatable' do
      maze = MazeSolver::MazeSolver.new(from_file: 'test.maze')
      maze.solve(18, 0, 12, 6).should be_true
    end
  end
end
