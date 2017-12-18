data = open('input').read

passphrases = data.split("\n").map(&:split)

puts passphrases.count { |x| x.sort.uniq == x.sort }
