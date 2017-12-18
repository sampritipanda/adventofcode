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

arr = (0..255).to_a
lengths = open("input").read.strip.split(",").map(&:to_i)
# arr = (0..4).to_a
# lengths = [3, 4, 1, 5]

pos = 0
lengths.each_with_index do |len, skip_size|
  if len > 0
    reverse_sub(arr, pos, (pos+len-1) % arr.size)
  end
  # p arr
  pos += len + skip_size
  pos %= arr.size
end

puts arr[0] * arr[1]
