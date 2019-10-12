require 'pry'

class Cell
  attr_reader :coordinate, :ship, :unoccupied

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_at = false

    # @show = false
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
    # binding.pry

    if empty? || show == false && !empty?
      "."
    elsif !empty? && show == true
      "S"
    elsif empty? && fired_upon?
      "M"
    elsif @ship == !(nil) && fired_upon? && !@ship.sunk?
      "H"
    elsif @ship == !(nil) && @ship.sunk?
      "X"
    end
  end
end
