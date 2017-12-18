a = 591
# a = 65
b = 393
# b = 8921

count = 0
pairs = 0
rounds = 0

vals_a = []
vals_b = []

while pairs < 5_000_000
  rounds += 1
  a = (a * 16807) % (2**31 - 1)
  vals_a << a if a % 4 == 0

  b = (b * 48271) % (2**31 - 1)
  vals_b << b if b % 8 == 0

  while !vals_a.empty? && !vals_b.empty?
    pairs += 1
    count += 1 if vals_a.shift % (1 << 16) == vals_b.shift % (1 << 16)
  end
end

puts count
puts rounds
