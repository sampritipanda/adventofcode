data = open('input').read

passphrases = data.split("\n").map { |x| x.split.map { |y| y.chars.sort.join } }

puts passphrases.count { |x| x.sort.uniq == x.sort }
