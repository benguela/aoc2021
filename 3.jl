data = parse.(Int,permutedims(reduce(hcat, collect.(readlines(joinpath(@__DIR__, "./3.txt"))))))

gamma = BitArray(map((s) -> s > size(data)[1]/2,  sum(data,dims=1)))
epsilon = .!gamma
Int(gamma.chunks[1]) * Int(epsilon.chunks[1])