data = open("input").read.strip
path = data.split(",")

x = 0
y = 0

def steps(x, y)
  abs = [x.abs, y.abs]
  ans = abs.min + (abs.max - abs.min)/2
end

max_steps = 0
path.each do |dir|
  if dir.include? "n"
    y += 1
    y += 1 if dir == "n"
  elsif dir.include? "s"
    y -= 1
    y -= 1 if dir == "s"
  end

  if dir.include? "e"
    x += 1
  elsif dir.include? "w"
    x -= 1
  end

  max_steps = [max_steps, steps(x, y)].max
end
p [x, y]

puts steps(x, y)
puts max_steps
