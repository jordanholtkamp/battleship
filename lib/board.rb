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
    @cells.keys.include?(cell.to_sym)
  end

  # def coordinate_split(cells_placed_array)
  #   cells_placed_array.map do |cell|
  #     cell.split(//, 2)
  #   end
  # end
  #
  # def convert_to_alpha_array
  #   alpha_array = coordinate_split.map do |cell|
  #     inner_array.first.ord
  #   end
  # end
  #
  # def convert_to_num_array
  #   num_array = coordinate_split.map do |cell|
  #     inner_array.last.to_i
  #   end
  # end

  def valid_placement?(ship, cells_placed_array)
    valid_length = ship.length == cells_placed_array.length
    #take our array and split to an array or arrays
    coordinates_split = cells_placed_array.map do |cell|
      cell.split(//, 2)
    end

    #take array of arrays and move to just an array of alpha
    filter_alpha_array = []
    coordinates_split.each do |inner_array|
      filter_alpha_array << inner_array.first.ord
    end


    #take array of arrays and move to just an array of numbers
    filter_numeric_array = []
    coordinates_split.each do |inner_array|
      filter_numeric_array << inner_array.last.to_i
    end

    # now we have filter_alpha_array and filter_numeric_array
    #each cons
    #four booleans = check names
    cons_num_test = filter_numeric_array.each_cons(2).all? { |a,b| b == a + 1 }
    cons_alpha_test = filter_alpha_array.each_cons(2).all? { |a,b| b == a + 1 }
    same_num_test = filter_numeric_array.each_cons(2).all? { |a,b| b == a }
    same_alpha_test = filter_alpha_array.each_cons(2).all? { |a,b| b == a }


    if same_alpha_test && cons_num_test && valid_length
      true
    elsif cons_alpha_test && same_num_test && valid_length
      true
    else
      false
    end
  end
end
