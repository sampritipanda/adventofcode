class Fixnum
  alias_method :inc, :+
  alias_method :dec, :-
end

registers = Hash.new(0)
ans2 = 0

File.readlines("input").each do |line|
  reg, op, val, _, reg2, op2, val2 = line.strip.split

  if registers[reg2].send(op2, val2.to_i)
    registers[reg] = registers[reg].send(op, val.to_i)
    ans2 = [registers[reg], ans2].max
  end
end

puts registers.values.max
puts ans2
