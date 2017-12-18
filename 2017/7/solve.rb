nodes = []
indeg = Hash.new(0)

File.readlines("input").each do |line|
  part1, part2 = line.strip.split(" -> ")
  node = part1.split[0]
  weight = part1.split[1][1..-2].to_i

  if part2
    children = part2.split(", ")
    nodes << node
    children.each { |child| indeg[child] += 1 }
  end
end

puts nodes.find { |node| indeg[node].zero? }
