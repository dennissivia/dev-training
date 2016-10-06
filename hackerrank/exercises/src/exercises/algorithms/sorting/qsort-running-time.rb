# coding: utf-8
# In order to compare the amount of work quicksort
# and insertion sort have to do, we compare the
# number of swaps / inserts each of those has
# to perform for a given input
def insertion_sort(a, n)
  shifts = 0
  (1..n-1).to_a.each do |i|
    tmp = a[i]
    cur = i
    while cur > 0 && a[cur - 1] > tmp
      a[cur] = a[cur - 1]
      cur -= 1
      shifts += 1
    end
    a[cur] = tmp
    # puts a.join(' ')
  end
  shifts
end

$swaps = 0
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
    if a[j] <= pivot
      a[i], a[j] = a[j], a[i]
      i += 1
      $swaps += 1
    end
  end

  $swaps += 1
  a[i], a[hi] = a[hi], a[i]
  # puts a.join(' ')
  i
end

def solve(arr, n)
  count1 = insertion_sort(arr.dup, n)
  quicksort(arr.dup, 0, n - 1)
  count2 = $swaps

  puts (count1 - count2)
end

n = gets.chomp.to_i
arr = gets.chomp.split.map(&:to_i)
solve(arr, n)
