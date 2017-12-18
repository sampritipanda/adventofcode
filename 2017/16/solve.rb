arr = ('a'..'p').to_a
hsh = {}

data = open('input').read.strip
instructions = data.split(",").map { |ins| [ins[0], ins[1..-1]] }
n = instructions.size
cnt = 0

while cnt < n
  type, data = instructions[cnt % n]

  if type == 's'
    dist = data.to_i
    arr.rotate!(-dist)
  elsif type == 'x'
    i, j = data.split('/').map(&:to_i)
    arr[i], arr[j] = arr[j], arr[i]
  elsif type == 'p'
    a, b = data.split('/')
    i = arr.find_index(a)
    j = arr.find_index(b)
    arr[i], arr[j] = arr[j], arr[i]
  end
  cnt += 1
end

puts arr.join
