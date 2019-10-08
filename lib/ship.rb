class Ship

  attr_reader :name, :length, :health
  def initialize(name, length = 2)
    @name = name
    @length = length
    @health = length
  end

  def sunk?
    if @health == 0
      true
    else
      false
    end 
  end

  def hit
    @health -= 1
  end
end
