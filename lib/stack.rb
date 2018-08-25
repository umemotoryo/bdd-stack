class Stack
  def initialize
    @buffer = []
  end

  def push(value)
    tap { |_| @buffer.push value }
  end

  def length
    @buffer.length
  end

  def pop
    @buffer.delete_at -1
  end

  def empty?
    @buffer.empty?
  end
end
