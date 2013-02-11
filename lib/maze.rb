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
          return false unless (0...height).include? row
          return false unless (0...width).include? column
          @grid[row][column].chr == ' '
      end

  end

end
