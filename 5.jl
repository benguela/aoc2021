data = map(x->split(x, " -> "),split(strip(read(joinpath(@__DIR__, "./5.txt"), String)), '\n'))
data = map(y->map(x->parse.(Int,split(x,",")),y),data)
data = map(z->reduce(vcat,z),data)

line_plot = zeros(Int,1000,1000)

function points_on_line(x1,y1,x2,y2)
  if x1 > x2
    x1, y1, x2, y2 = x2, y2, x1, y1
  end
  slope = (y2-y1)/(x2-x1)
  y_intercept = y1-slope*x1
  [(x,Int(x*slope+y_intercept)) for x in range(x1, x2) if Int(x*slope) == x*slope]
end


function plotline(x1,y1,x2,y2)
  global line_plot

  if x1 == x2
    if y1 < y2
      line_plot[x1,y1:y2] .+= 1
    else
      line_plot[x1,y2:y1] .+= 1
    end
  elseif y1 == y2
    if x1 < x2
      line_plot[x1:x2,y1] .+= 1
    else
      line_plot[x2:x1,y1] .+= 1
    end
  else
    # this is for part2 of the problem
    points = points_on_line(x2,y2,x1,y1)
    for (x,y) in points
      line_plot[x,y] += 1 
    end
  end
end

function solve(data)
  global line_plot
  
  for d in data
    plotline(d...)
  end

  length(filter(i->i>=2,line_plot))
end

solve(data)