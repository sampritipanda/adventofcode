def check(guards, offset)
  guards.each do |depth, range|
    return if range == 1 || (depth + offset) % (2 * (range - 1)) == 0
  end
  true
end

guards = []

File.readlines("input").each do |line|
  depth, range = line.split.map(&:to_i)
  guards << [depth, range]
end

lcm = guards.reduce(1) { |acc, x| acc.lcm(2 * (x[1] - 1)) }
puts lcm

ans = lcm.times.find { |i| check(guards, i) }
puts ans
