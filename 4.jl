draw = []
boards = []
winning_num = 0
winning_board = []

open(joinpath(@__DIR__, "./4.txt")) do io
  global draw, boards, data

  # read draw
  draw = parse.(Int,split(strip(readline(io)),","))
  
  # ignore the next blank line
  readline(io) 
  
  # read the boards into 5x5 matrices
  data = split.(split(read(io,String), "\n\n"),"\n")
  data = map(x->split.(x," "),data)
  data = map(x->map(y->filter(z->z!="",y),x),data)
  boards = map(x->parse.(Int,hcat(x...)),data)
end

function score(x,y)
  if x == -1 && y == -1
    return 0
  elseif x == -1
    return y
  elseif y == -1
    return x
  else
    return x+y
  end
end


for num in draw, board in boards
  global winning_board, winning_num
  board[board.==num] .= -1
  if sum(all(i->i==-1,board,dims=1)) > 0 || sum(all(i->i==-1,board,dims=2)) > 0
    winning_board = board
    winning_num = num
    break
  end
end

board_score = reduce(score, winning_board)

board_score * winning_num