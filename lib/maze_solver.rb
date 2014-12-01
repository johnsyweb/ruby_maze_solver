# encoding: UTF-8

require 'maze_solver/version'

module MazeSolver
  # Maze solver: solves a maze
  class MazeSolver
    def initialize(args = {})
      @grid = if args[:from_grid]
                args[:from_grid].split("\n")
              elsif args[:from_file]
                from_file(args[:from_file])
              end
      pad_short_rows
    end

    def pad_short_rows
      w = width
      grid.each { |row| row << ' ' * (w - row.length) if w > row.length }
    end

    def height
      grid.size
    end

    def width
      grid.map(&:length).max
    end

    def visitable?(x, y)
      row, column = y, x
      return false unless (0...height).include? row
      return false unless (0...width).include? column
      grid[row][column].chr == ' '
    end

    def visit(x, y)
      row, column = y, x
      grid[row][column] = '.'
    end

    def unvisit(x, y)
      row, column = y, x
      grid[row][column] = ' '
    end

    def solve(start_x, start_y, end_x, end_y)
      return false unless visitable?(start_x, start_y)

      visit(start_x, start_y)

      return true if [start_x, start_y] == [end_x, end_y]

      return true if adjacent_cell_solvable?(start_x, start_y, end_x, end_y)

      unvisit(start_x, start_y)

      false
    end

    def adjacent_cell_solvable?(start_x, start_y, end_x, end_y)
      solve(start_x + 1, start_y, end_x, end_y) ||
        solve(start_x, start_y + 1, end_x, end_y) ||
        solve(start_x - 1, start_y, end_x, end_y) ||
        solve(start_x, start_y - 1, end_x, end_y)
    end

    def to_s
      grid.join("\n") << "\n"
    end

    def from_file(filename)
      grid = File.open(filename, 'r').readlines
      grid.each(&:strip!)
    end

    private

    attr_accessor :grid
  end
end
