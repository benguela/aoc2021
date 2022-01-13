data = parse.(Int, split(read(joinpath(@__DIR__, "./6.txt"), String), ","))

data = [3,4,3,1,2]

function part1(fish)
  for day in 1:80
    new_fish = fill(8,length(filter(x->x==0,fish)))
    fish = map(x->x==0 ? 6 : x - 1, fish)
    append!(fish,new_fish)
  end

  length(fish)
end

function inc_day(current_counts,days)
  next_counts = Dict{Int,Int}()
  if days > 0
    for i in [1,2,3,4,5,6,7,8,0]
      if i == 0 && haskey(current_counts,i)
        next_counts[8] = current_counts[i]
        if haskey(next_counts,6)
          next_counts[6] += current_counts[i]
        else
          next_counts[6] = current_counts[i]
        end
      elseif i > 0 && haskey(current_counts,i)
        next_counts[i - 1] = current_counts[i]
      end
    end
    return inc_day(next_counts, days - 1)
  else
    return current_counts
  end
end
   

function part2(fish,days)
  timer_counts = Dict{Int,Int}()
  for n in 1:5
    timer_counts[n] = length(filter(x->x==n,fish))
  end
  return sum(values(inc_day(timer_counts,days)))

end

part1(data)

part2(data,256)


