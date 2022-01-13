fish = parse.(Int, split(read(joinpath(@__DIR__, "./6.txt"), String), ","))

fish = [3,4,3,1,2]

for day in 1:80
  new_fish = fill(8,length(filter(x->x==0,fish)))
  fish = map(x->x==0 ? 6 : x - 1, fish)
  append!(fish,new_fish)
end

length(fish)


