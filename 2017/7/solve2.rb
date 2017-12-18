nodes = []
children = Hash.new([])
parent = {}
weight = {}
sum = {}

def dfs(node, sum, weight, parent, children)
  sum[node] = weight[node]

  children[node].each do |child|
    sum[node] += dfs(child, sum, weight, parent, children)
  end

  sum[node]
end

File.readlines("input").each do |line|
  part1, part2 = line.strip.split(" -> ")
  node = part1.split[0]
  nodes << node
  weight[node] = part1.split[1][1..-2].to_i

  if part2
    children[node] = part2.split(", ")
    children[node].each do |child|
      parent[child] = node
    end
  end
end

root = nodes.find { |node| parent[node].nil? }
dfs(root, sum, weight, parent, children)

nodes.each do |node|
  next if children[node].empty?
  sums = children[node].map { |child| sum[child] }
  next if sums.min == sums.max
  p sums

  sel = (sums.count(sums.min) == 1 ? sums.min : sums.max)
  req_node = children[node].find { |child| sum[child] == sel }
  ans = weight[req_node] + (sums.max + sums.min - 2 * sel)
  puts ans
end
