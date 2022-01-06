function readTestInput()
  draw = [7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1]
  boards = [
    [22 13 17 11  0;
    8  2 23  4 24;
    21  9 14 16  7;
    6 10  3 18  5;
    1 12 20 15 19],

    [3 15  0  2 22;
    9 18 13 17  5;
    19  8  7 25 23;
    20 11 10 24  4;
    14 21 16 12  6],

    [14 21 17 24  4;
    10 16 15  9 19;
    18  8 23 26 20;
    22 11 13  6  5;
    2  0 12  3  7]
  ]
  return draw,boards
end

function readInput()
  open(joinpath(@__DIR__, "./4.txt")) do io
    # read draw
    draw = parse.(Int,split(strip(readline(io)),","))
    
    # ignore the next blank line
    readline(io) 
    
    # read the boards into 5x5 matrices
    data = split.(split(read(io,String), "\n\n"),"\n")
    data = map(x->split.(x," "),data)
    data = map(x->map(y->filter(z->z!="",y),x),data)
    boards = map(x->parse.(Int,hcat(x...)),data)
    return draw,boards
  end
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

function part1(draw,boards)
  for num in draw, board in boards
    board[board.==num] .= -1
    if sum(all(i->i==-1,board,dims=1)) > 0 || sum(all(i->i==-1,board,dims=2)) > 0
      return board, num
    end
  end
end

function part2(draw,boards)
  winning_board = undef
  winning_num = undef
  while !isempty(boards)
    winning_board, winning_num = part1(draw,boards)
    setdiff!(boards,[winning_board])
  end
  return winning_board, winning_num
end

draw,boards = readInput()
winning_board, winning_num = part1(draw,boards)
board_score = reduce(score, winning_board)
board_score * winning_num

draw,boards = readInput()
winning_board, winning_num = part2(draw,boards)
board_score = reduce(score, winning_board)
board_score * winning_num