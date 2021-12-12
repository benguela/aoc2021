data = split(read(joinpath(@__DIR__, "./1.txt"), String), "\n")

sum(map((x, y) -> x > y, data[2:end], data[1:end-1]))