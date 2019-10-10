require 'pry'

class Board
  attr_reader :cells
  def initialize

    @cells =
    {
      "A1": Cell.new("A1"),
      "A2": Cell.new("A2"),
      "A3": Cell.new("A3"),
      "A4": Cell.new("A4"),
      "B1": Cell.new("B1"),
      "B2": Cell.new("B2"),
      "B3": Cell.new("B3"),
      "B4": Cell.new("B4"),
      "C1": Cell.new("C1"),
      "C2": Cell.new("C2"),
      "C3": Cell.new("C3"),
      "C4": Cell.new("C4"),
      "D1": Cell.new("D1"),
      "D2": Cell.new("D2"),
      "D3": Cell.new("D3"),
      "D4": Cell.new("D4")
  }
  end

  def valid_coordinate?(cell)
    split_cell = cell.split(//, 2)
    ("A".."D") === split_cell[0] && (1..4) === split_cell[1].to_i
  end

  def valid_placement?(ship, cells_placed_array)
    ship.length == cells_placed_array.length
    # split_cons = cells_placed_array.split(//, 2)
    something = cells_placed_array.map do |cell|
      cell.split(//, 2)
    end
    sorted_array = something.map do |element|
      binding.pry
      element[][0]
    end
    binding.pry

  end
end