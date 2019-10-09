require 'pry'

class Cell
  attr_reader :coordinate, :ship, :unoccupied
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship
    @unoccupied = true
    @fired_at = false
  end

  def empty?
    @unoccupied
  end

  def place_ship(ship_obj)
    @ship = ship_obj
    @unoccupied = false
  end

  def fired_upon?
    # if empty?
    # return @ship.health < @ship.length ||
    @fired_at
  end

  def fire_upon
    #R1 = possible refactor to a boolean expression
    if empty? == false
      @ship.hit
      @fired_at = true
    else
      @fired_at = true
    end
  end

  def render(show = false)
    # possible refactor :)
    if fired_upon? == false && show == false
      "."
    elsif empty? == true && fired_upon? == true
      "M"
    elsif show == true && empty? == false
      "S"
    elsif fired_upon? == true && empty? == false && @ship.sunk? == false
      "H"
    elsif @ship.sunk? == true
      "X"
    end
  end
end
