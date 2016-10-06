
def quicksort(a, lo, hi)
  if lo < hi
    p = partition(a, lo, hi)
    quicksort(a, lo, p - 1)
    quicksort(a, p + 1, hi)
  end
end

def partition(a, lo, hi)
  pivot = a[hi]
  i = lo
  i.upto(hi - 1) do |j|
    # next if a[j] > pivot
    if a[j] <= pivot
      # swap a[i], a[j]
      a[i], a[j] = a[j], a[i]
      i += 1
    end
  end
  a[i], a[hi] = a[hi], a[i]
  i
end

def get_index(arr, v)
  n = arr.length
  0.upto(n - 1).each do |i|
    return i if arr[i] == v
  end
end

v = gets.chomp.to_i
n = gets.chomp.to_i
arr = gets.chomp.split.map(&:to_i)
quicksort(arr, 0, n - 1 )
puts get_index(arr, v)
