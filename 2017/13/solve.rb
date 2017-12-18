sev = 0

File.readlines("input").each do |line|
  depth, range = line.split.map(&:to_i)

  if range == 1 || depth % (2 * (range - 1)) == 0
    sev += depth * range
  end
end

puts sev
