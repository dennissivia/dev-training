
def partition(a, lo, hi, pivot_index)
  pivot = a[pivot_index]
  i = lo
  i.upto(hi - 1).each do |j|
    if a[j] <= pivot
      a[i], a[j] = a[j], a[i]
      i += 1
    end
  end
  a[i], a[hi] = a[hi], a[i]
  i
end

# def quickselect(a, lo, hi, n)
#   return a[lo] if lo == hi

#   p1 = hi # for simplicities sake
#   p = partition(a, lo, hi, p1)

#   if p == n
#     a[n]
#   elsif n < p
#     quickselect(a, lo, hi - 1, n)
#   else
#     quickselect(a, lo + 1, hi, n)
#   end
# end

def quickselect(a, lo, hi, n)
  loop do
    return a[lo] if lo == hi

    pi = hi
    p = partition(a, lo, hi, pi)

    return a[n] if p == n

    if n < p
      hi = p - 1
    else
      lo = p + 1
    end
  end
end

n   = gets.chomp.to_i
arr = gets.chomp.split.map(&:to_i)
nth = ((n + 1) / 2) - 1
result = quickselect(arr, 0, n - 1, nth)
puts result
