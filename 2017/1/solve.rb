str = gets.strip
digits = str.chars
n = digits.size

sum = 0
n.times do |i|
  if digits[i] == digits[(i+1)%n]
    sum += digits[i].to_i
  end
end
puts sum
