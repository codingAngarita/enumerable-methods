# This custom Enumerable module replicates the work of
# ... the default Enumerable methods
module Enumerable
  def my_each
    for i in (0...length)
      yield(self[i])
    end
  end

  def my_each_with_index
    for i in (0...length)
      yield(self[i], i)
    end
  end

  def my_select
    result = []
    each do |current|
      result.push(current) if yield(current)
    end
    return result
  end

  def my_all?
    each do |current|
      result = yield(current)
      return false if result.nil? || result == false
    end
    return true
  end

  def my_none?
    each do |current|
      result = yield(current)
      return false if result.nil? || result
    end
    return true
  end

  def my_count
    counter = 0
    each do |current|
      result = yield(current)
      counter += 1 if result == true
    end
    return counter
  end

  def my_map(proc=nil)
    each do |current|
      if proc
        self[i] = proc.call(current)
      else
        self[i] = yield(current)
      end
    end
    return self
  end

  def my_inject
    counter = self[0]
    each do |current|
      result = yield(counter, current)
      counter = result
    end
    return counter
  end

  def multiply_els
    return my_inject { |counter, nexti| counter * nexti }
  end
end
