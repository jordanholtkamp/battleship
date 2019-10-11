require 'pry'

class Cell
  attr_reader :coordinate, :ship, :unoccupied

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship
    @fired_at = false
  end

  def empty?
    @ship == nil
  end

  def place_ship(ship_obj)
    @ship = ship_obj
  end

  def fired_upon?
    @fired_at
  end

  def fire_upon
    if empty? == false
      @ship.hit
      @fired_at = true
    else
      @fired_at = true
    end
  end

  def render(show = false)
    if !fired_upon? && show == false
      "."
    elsif empty? && fired_upon?
      "M"
    elsif show == true && !empty?
      "S"
    elsif fired_upon? && !empty? && !@ship.sunk?
      "H"
    elsif @ship.sunk?
      "X"
    end
  end
end
