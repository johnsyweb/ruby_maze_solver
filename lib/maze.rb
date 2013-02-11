require "maze/version"

module Maze

  class Maze

      def initialize(a_grid)
          @grid = a_grid.split('\n')
      end

      def height
          @grid.size
      end

      def width
          @grid.map { |row| row.length }.max
      end

      def visitable?(x, y)
          row, column = y, x
          @grid[row][column].chr == ' '
      end

  end

end
