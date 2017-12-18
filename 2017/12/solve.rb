def find(u, a)
  return a if u[a] == a
  u[a] = find(u, u[a])
end

def merge(u, a, b)
  a = find(u, a)
  b = find(u, b)

  u[a] = b if a != b
end

file = open("input")

n = file.gets.strip.to_i

u = Array.new(n) { |i| i }
nodes = Array.new(n) { [] }

n.times do |i|
  _, _, *a = file.gets.strip.split
  nodes[i] += a.map(&:to_i)
  nodes[i].each { |j| merge(u, i, j) }
end

group_0_sz = n.times.count { |x| find(u, x) == find(u, 0) }
puts group_0_sz
group_cnt = n.times.map { |x| find(u, x) }.sort.uniq.size
puts group_cnt
