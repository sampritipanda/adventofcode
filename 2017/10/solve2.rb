require 'pry-byebug'

def reverse_sub(a, l, r)
  n = a.size
  if l <= r
    len = r - l + 1
  else
    len = (r + 1) + (n - l)
  end
  (len/2).times do
    a[l], a[r] = a[r], a[l]
    l = (l + 1) % a.size
    r = (r - 1) % a.size
  end
end

input = open("input").read.strip
# input = gets.strip

rounds = 64
lengths = input.chars.map(&:ord)
lengths += [17, 31, 73, 47, 23]
p lengths

arr = (0..255).to_a
pos = 0
skip_size = 0
rounds.times do
  lengths.each do |len|
    if len > 0
      reverse_sub(arr, pos, (pos+len-1) % arr.size)
    end
    pos += len + skip_size
    pos %= arr.size
    skip_size += 1
  end
end

hash = arr.each_slice(16).map { |block| block.reduce(0, :^) }.map { |num| num.to_s(16).rjust(2, "0") }.join
puts hash
