data = open("input").read

arr = data.split("\n").map { |x| x.split("\t").map(&:to_i) }

ans = arr.map do |x|
  ans = -1
  x.size.times do |i|
    x.size.times do |j|
      next if i == j
      if x[j] != 0 && x[i] % x[j] == 0
        ans = x[i]/x[j]
        break
      end
    end
    break if ans != -1
  end
  ans
end
puts ans.reduce(0, :+)
