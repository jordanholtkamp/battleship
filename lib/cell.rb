require 'pry'

class Cell
  attr_reader :coordinate, :ship, :unoccupied
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship
    @unoccupied = true
  end

  def empty?
    @unoccupied
  end

  def place_ship(ship_obj)
    @ship = ship_obj
    @unoccupied = false
  end

  def fired_upon?
    return @ship.health < @ship.length
    false
  end

  def fire_upon
    #R1 = possible refactor to a boolean expression
    if empty? == false
      @ship.health -= 1
    end
  end

  def render
    if empty?
      "."
    elsif empty? && !(fire_upon)
      "M"
    end
  end
end
