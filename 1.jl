using RollingFunctions

data = parse.(Int, split(read(joinpath(@__DIR__, "./1.txt"), String), "\n"))

sum(map((x, y) -> x > y, data[2:end], data[1:end-1]))

sw = rolling((x)->sum(x),data,3)

sum(map((x, y) -> x > y, sw[2:end], sw[1:end-1]))




