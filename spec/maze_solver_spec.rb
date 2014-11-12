# encoding: UTF-8

require 'spec_helper'

describe MazeSolver::MazeSolver do
  context 'a simple 8 x 3 maze' do
    let(:grid) do
      <<-GRID
********

********
GRID
    end

    subject(:maze) { described_class.new(from_grid: grid) }

    its(:width) { should be 8 }
    its(:height) { should be 3 }

    it 'is possible to visit an empty space' do
      expect(maze).to be_visitable(0, 1)
    end

    it 'is not possible to visit a wall' do
      expect(maze).to_not be_visitable(0, 0)
    end

    it 'is not possible to visit outside the maze' do
      expect(maze).to_not be_visitable(8, 3)
    end

    it 'is not possible to visit a visited space' do
      maze.visit(0, 1)
      expect(maze).to_not be_visitable(0, 1)
    end

    it 'is possible to visit an unvisited space' do
      maze.visit(0, 1)
      maze.unvisit(0, 1)
      expect(maze).to be_visitable(0, 1)
    end

    it 'is soluble' do
      expect(maze.solve(0, 1, 7, 1)).to be true
    end

    it 'is soluble backwards' do
      expect(maze.solve(7, 1, 0, 1)).to be true
    end

    it 'is printable' do
      expect(maze.to_s).to eq "********\n" \
        "        \n" \
        "********\n"
    end

    it 'is printable when solved' do
      maze.solve(0, 1, 7, 1)
      expect(maze.to_s).to eq <<-GRID
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

    it 'is soluble' do
      expect(maze.solve(0, 1, 3, 3)).to be true
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

    it 'is insoluble' do
      expect(maze.solve(0, 1, 3, 3)).to be false
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

    before do
      expect(File).to receive(:open).with('test.maze', 'r').and_return(test_maze)
    end

    it 'is creatable' do
      maze = MazeSolver::MazeSolver.new(from_file: 'test.maze')
      expect(maze.solve(18, 0, 12, 6)).to be true
    end
  end
end
