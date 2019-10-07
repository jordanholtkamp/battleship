class Ship

  attr_reader :name, :length
  def initialize(name, length = 2)
    @name = name
    @length = length
  end

end
