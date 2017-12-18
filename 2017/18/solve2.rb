require 'pry-byebug'

class VM
  def initialize(code, pid, send_queue, recv_queue)
    @registers = Hash.new(0)
    @registers['p'] = pid
    @instructions = code.strip.split("\n").map(&:split)
    @send_queue = send_queue
    @recv_queue = recv_queue
    @send_count = 0
    @ip = 0
  end

  attr_reader :send_count

  def step
    if @ip < @instructions.size
      ins = @instructions[@ip]
      res = self.send(*ins)
      @ip += 1 if res
      res
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
    @send_queue.push get_val(x)
    @send_count += 1
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
    if @recv_queue.empty?
      return false
    end
    @registers[x] = @recv_queue.shift
  end

  def jgz(x, y)
    @ip += (get_val(y) - 1) if get_val(x) > 0
    0
  end
end

data = open("input").read

queue_0 = []
queue_1 = []

vm_0 = VM.new(data, 0, queue_0, queue_1)
vm_1 = VM.new(data, 1, queue_1, queue_0)

loop do
  res_0 = vm_0.step
  res_1 = vm_1.step
  break unless (res_0 || res_1)
end

puts vm_1.send_count
