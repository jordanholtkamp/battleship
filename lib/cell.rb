require 'pry'

class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_at = false
  end

  def empty?
    if @ship == nil
      true
    else
      false
    end
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

  def render (show = false)
    if empty? && !fired_upon? || show == false && !empty? && !fired_upon?
      "."
    elsif !empty? && show == true && !fired_upon?
      "S"
    elsif empty? && fired_upon?
      "M"
    elsif !empty? && fired_upon? && !@ship.sunk?
      "H"
    elsif !empty? && @ship.sunk?
      "X"
    end
  end
end
