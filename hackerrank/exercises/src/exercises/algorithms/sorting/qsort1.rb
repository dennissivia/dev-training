# coding: utf-8

def partition(arr)
  p = arr[0]
  # [left, equals, right]
  result = [[],[],[]]

  arr.each do |x|
    if x == p
      result[1] << x
    elsif x < p
      result[0] << x
    elsif x > p
      result[2] << x
    end
  end
  result
end

def qsort(arr)
  return arr if arr.length <= 1

  left, equals, right = partition(arr)
  # puts left.inspect
  result = qsort(left) + equals + qsort(right)
  puts result.join(" ")
  result
end
# puts (qsort(arr).flatten).join(' ')
# (qsort(arr).flatten).join(' ')

=begin
algorithm quicksort(A, lo, hi) is
    if lo < hi then
        p := partition(A, lo, hi)
        quicksort(A, lo, p – 1)
        quicksort(A, p + 1, hi)
=end
=begin
algorithm partition(A, lo, hi) is
    pivot := A[hi]
    i := lo        // place for swapping
    for j := lo to hi – 1 do
        if A[j] ≤ pivot then
            swap A[i] with A[j]
            i := i + 1
    swap A[i] with A[hi]
    return i
=end

def quicksort_inplace(a, lo, hi)
  if lo < hi
    p = partition2(a, lo, hi)
    quicksort_inplace(a, lo, p - 1)
    quicksort_inplace(a, p + 1, hi)
  end
end

def partition2(a, lo, hi)
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
  # swap a[i], a[hi]
  a[i], a[hi] = a[hi], a[i]
  puts a.join(' ')
  i
end

n = gets.chomp.to_i
arr = gets.chomp.split.map(&:to_i)

quicksort_inplace(arr, 0, n - 1)
