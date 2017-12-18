str = open("input").read.strip

level = 0
score = 0
garbage_count = 0
garbage = false
skip = false

str.each_char do |c|
  if skip
    skip = false
    next
  end
  if c == '!'
    skip = true
    next
  end

  if c == '>'
    garbage = false
    next
  end
  if garbage
    garbage_count += 1
    next
  end

  if c == '{'
    level += 1
    score += level
  elsif c == '}'
    level -= 1
  elsif c == '<'
    garbage = true
  end
end

puts score
puts garbage_count
