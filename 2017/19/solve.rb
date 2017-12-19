data = open("input").read
grid = data.split("\n")

i = 0
j = grid[0].index('|')
dir = [1, 0]

ans = ''
ans2 = 0

loop do
  break if i < 0 || i >= grid.size
  break if j < 0 || j >= grid[0].size
  break if grid[i][j] == ' '

  if grid[i][j] == '+'
    if i < grid.size && grid[i + 1][j] != ' ' && !(dir[0] == -1 && dir[1] == 0)
      dir[0] = 1
      dir[1] = 0
    elsif i > 0 && grid[i - 1][j] != ' ' && !(dir[0] == 1 && dir[1] == 0)
      dir[0] = -1
      dir[1] = 0
    elsif j < grid[0].size && grid[i][j + 1] != ' ' && !(dir[0] == 0 && dir[1] == -1)
      dir[0] = 0
      dir[1] = 1
    elsif j > 0 && grid[i][j - 1] != ' ' && !(dir[0] == 0 && dir[1] == 1)
      dir[0] = 0
      dir[1] = -1
    end
  else
    if grid[i][j] != '|' && grid[i][j] != '-'
      ans += grid[i][j]
    end
  end

  i += dir[0]
  j += dir[1]
  ans2 += 1
end

puts ans
puts ans2
