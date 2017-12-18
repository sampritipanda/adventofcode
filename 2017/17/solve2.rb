steps = 329

i = 0
ans = -1

(1..50000000).each do |j|
  i = (i + steps) % j
  ans = j if i == 0
  i += 1
end

puts ans
