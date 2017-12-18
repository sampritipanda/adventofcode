a = 591
# a = 65
b = 393
# b = 8921

count = 0
rounds = 40_000_000

rounds.times do
  a = (a * 16807) % (2**31 - 1)
  b = (b * 48271) % (2**31 - 1)

  count += 1 if a % (1 << 16) == b % (1 << 16)
end

puts count
