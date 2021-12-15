data = split(strip(read(joinpath(@__DIR__, "./2.txt"), String)), '\n')

#part 1
position = Dict(:horizontal => 0, :depth => 0)

command = Dict("forward" => (:horizontal,+), "down" => (:depth,+), "up" => (:depth,-))

function executeCommands(data)
  global position,command
  direction,distance = split(data,' ')
  position[command[direction][1]] = command[direction][2](position[command[direction][1]],parse(Int,distance))
end

executeCommands.(data)
position[:horizontal]*position[:depth]



# part 2
position = Dict(:horizontal => 0, :depth => 0, :aim => 0)

command = Dict("forward" => (:horizontal,+), "down" => (:aim,+), "up" => (:aim,-))

function executeCommands2(data)
  global position
  direction,distance = split(data,' ')
  d = parse(Int,distance)
  position[command[direction][1]] = command[direction][2](position[command[direction][1]],d)
  if direction == "forward"
    position[:depth] = position[:depth] + d * position[:aim]
  end
end

executeCommands2.(data)
position[:horizontal]*position[:depth]




