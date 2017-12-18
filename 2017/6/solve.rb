require 'set'

data = open("input").read

arr = data.split.map(&:to_i)
n = arr.size
s = Set.new
vis = []
ans = 0

while !s.include? arr
  s.add(arr)
  vis << arr.dup
  ans += 1
  max_el = arr.max
  i = arr.find_index { |x| x == max_el }
  j = (i + 1) % n
  cnt = arr[i]
  arr[i] = 0
  cnt.times do
    arr[j] += 1
    j = (j + 1) % n
  end
end

puts ans
puts vis.size - vis.find_index(arr)
