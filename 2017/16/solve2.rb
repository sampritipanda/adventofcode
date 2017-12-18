arr = ('a'..'p').to_a
hsh = {}

data = open('input').read.strip
instructions = data.split(",")
cnt = 0
rounds = 1_000_000_000

loop do
  str = arr.join
  if hsh[str]
    cycle_size = cnt - hsh[str]
    cnt += (rounds - cnt)/cycle_size * cycle_size
  end
  if cnt == rounds
    puts str
    exit
  end
  hsh[str] = cnt

  instructions.each do |ins|
    type, data = ins[0], ins[1..-1]

    if type == 's'
      dist = data.to_i
      arr.rotate!(-dist)
    elsif type == 'x'
      i, j = data.split('/').map(&:to_i)
      arr[i], arr[j] = arr[j], arr[i]
    elsif type == 'p'
      a, b = data.split('/')
      i = arr.find_index(a)
      j = arr.find_index(b)
      arr[i], arr[j] = arr[j], arr[i]
    end

    cnt += 1
    if cnt == rounds
      puts arr.join
      exit
    end
  end
end
