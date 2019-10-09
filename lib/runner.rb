puts require './lib/ship'
#=> true

 cruiser = Ship.new("Cruiser", 3)
 puts   cruiser.class
#=> #<Ship:0x00007feb05112d10...>

puts cruiser.name
#=> "Cruiser"

puts cruiser.length
#=> 3

puts cruiser.health
#=> 3

puts cruiser.sunk?
#=> false

puts cruiser.hit

puts cruiser.health
#=> 2

puts cruiser.hit

puts cruiser.health
#=> 1

puts cruiser.sunk?
#=> false

puts cruiser.hit

puts cruiser.sunk?
#=> true
