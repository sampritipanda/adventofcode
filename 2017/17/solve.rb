steps = 329
# steps = 3

arr = [0]
i = 0

(1..2017).each do |j|
  i = (i + steps) % arr.size
  arr.insert(i + 1, j)
  i += 1
end

ans = arr[(i + 1) % arr.size]
puts ans
