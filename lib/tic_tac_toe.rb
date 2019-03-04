def turn_count(board)
  turn = 0
  board.each {|t| turn += 1 if t != " "}
  turn
end

def current_player(board)
  turn_count(board).even? ? "X" : "O"
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    combo = win_combination.map { |x| board[x] }
    return win_combination if combo.all? { |w| w == "X" } || combo.all? { |w| w == "O" }
  end
  return false
end

def full?(board)
  board.all? { |x| x == "X" || x == "O" }
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  winning_combination = won?(board)
  return nil unless winning_combination
  board[winning_combination[0]]
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end