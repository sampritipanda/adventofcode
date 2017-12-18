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

def get_hash(str)
  rounds = 64
  lengths = str.chars.map(&:ord)
  lengths += [17, 31, 73, 47, 23]

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
end

def find(u, a)
  return a if u[a] == a
  u[a] = find(u, u[a])
end

def merge(u, a, b)
  a = find(u, a)
  b = find(u, b)

  u[a] = b if a != b
end

def get_ind(i, j)
  i * 128 + j
end

# input = "flqrgnkx"
input = "vbqugkhl"

grid = []

ans = 0
128.times do |i|
  curr = "#{input}-#{i}"
  hash = get_hash(curr)
  bitstring = hash.chars.map { |x| x.to_i(16).to_s(2).rjust(4, '0') }.join
  grid << bitstring
  ans += bitstring.count('1')
end
puts ans

u = Array.new(128 * 128) { |i| i }
128.times do |i|
  128.times do |j|
    next if grid[i][j] == '0'

    merge(u, get_ind(i, j), get_ind(i - 1, j)) if (i > 0 && grid[i - 1][j] == '1')
    merge(u, get_ind(i, j), get_ind(i + 1, j)) if (i < 127 && grid[i + 1][j] == '1')
    merge(u, get_ind(i, j), get_ind(i, j - 1)) if (j > 0 && grid[i][j - 1] == '1')
    merge(u, get_ind(i, j), get_ind(i, j + 1)) if (j < 127 && grid[i][j + 1] == '1')
  end
end

groups = []
128.times do |i|
  128.times do |j|
    if grid[i][j] == '1'
      groups << find(u, get_ind(i, j))
    end
  end
end
ans2 = groups.sort.uniq.size
puts ans2
