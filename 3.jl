data = parse.(Int,permutedims(reduce(hcat, collect.(readlines(joinpath(@__DIR__, "./3.txt"))))))

map((s) -> s > size(data)[1]/2,  sum(data,dims=1))