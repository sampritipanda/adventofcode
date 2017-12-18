data = open("input").read
arr = data.split("\n").map(&:to_i)
n = arr.size
i = 0
cnt = 0

while i < n and i >= 0
  cnt += 1
  orig_cnt = arr[i]
  if arr[i] >= 3
    arr[i] -= 1
  else
    arr[i] += 1
  end
  i += orig_cnt
end

puts cnt
