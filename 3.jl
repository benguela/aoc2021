data = parse.(Int,permutedims(reduce(hcat, collect.(readlines(joinpath(@__DIR__, "./3.txt"))))))

function bitarr_to_int(arr)
  return sum(arr .* (2 .^ collect(length(arr)-1:-1:0)))
end

function gamma(arr)
  return BitArray(map((s) -> s >= size(arr)[1]/2,  sum(arr,dims=1)))
end

function epsilon(arr)
  return .!gamma(arr)
end

g = gamma(data)
e = epsilon(data)

# answer to part 1
bitarr_to_int(g') * bitarr_to_int(e')

function rating(data,rate_func,index=1)
  if size(data,1) == 1
    return bitarr_to_int(BitArray(data)')
  end
  rate = rate_func(data)
  filtered_data  = data[data[:,index].==rate[index],:]
  return rating(filtered_data, rate_func, index += 1)
end

o2 = rating(data, gamma)
co2 = rating(data, epsilon)

#answer to part 2
o2*co2