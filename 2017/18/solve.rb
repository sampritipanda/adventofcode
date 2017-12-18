class VM
  def initialize(code)
    @registers = Hash.new(0)
    @stack = []
    @instructions = code.strip.split("\n").map(&:split)
  end

  def solve_1
    @ip = 0
    ans = -1
    while @ip < @instructions.size
      ins = @instructions[@ip]
      res = self.send(*ins)
      if ins[0] == 'rcv' && res
        return res
      end
      @ip += 1
    end
  end

  def get_val(x)
    if /\A[-+]?\d+\z/ === x
      return x.to_i
    else
      return @registers[x]
    end
  end

  def snd(x)
    @stack.push get_val(x)
  end

  def set(x, y)
    @registers[x] = get_val(y)
  end

  def add(x, y)
    @registers[x] += get_val(y)
  end

  def mul(x, y)
    @registers[x] *= get_val(y)
  end

  def mod(x, y)
    @registers[x] %= get_val(y)
  end

  def rcv(x)
    @stack.last if get_val(x)
  end

  def jgz(x, y)
    @ip += (get_val(y) - 1) if get_val(x) > 0
  end
end

data = open("input").read
vm = VM.new(data)
puts vm.solve_1
