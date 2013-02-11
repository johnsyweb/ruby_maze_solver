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

      def visit(x, y)
          row, column = y, x
          @grid[row][column] = '*'
      end

      def unvisit(x, y)
          row, column = y, x
          @grid[row][column] = ' '
      end

      def solve(start_x, start_y, end_x, end_y)
          return false unless visitable? start_x, start_y

          visit start_x, start_y

          return true if start_x == end_x and start_y == end_y

          unless solve start_x + 1, start_y, end_x, end_y  \
              or solve start_x, start_y + 1, end_x, end_y  \
              or solve start_x - 1, start_y, end_x, end_y  \
              or solve start_x, start_y - 1, end_x, end_y 

              unvisit start_x, start_y
              return false
          end

          return true
      end

  end

end
