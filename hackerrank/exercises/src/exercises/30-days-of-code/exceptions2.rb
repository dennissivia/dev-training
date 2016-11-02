RangeError Class.new(StandardError)

class Calculator
  def power(n, p)
    raise RangeError, "n and p should be non-negative" if n.neg? || p.neg?
    n ** p
  end
end
