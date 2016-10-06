module Sorting
  # hackerrank sorting tutorial insertion sort 2
  def insertion_sort_step(a, pos)
    tmp = a[pos]
    cur = pos
    while cur > 0 && a[cur - 1] > tmp
      a[cur] = a[cur - 1]
      cur -= 1
    end
    a[cur] = tmp
    a
  end
  module_function :insertion_sort_step

  def insertion_sort2(a, n)
    (1..n-1).to_a.each do |i|
      a = Sorting.insertion_sort_step(a, i)
      puts a.join(' ')
    end
  end
  module_function :insertion_sort2
end

def solve_challange2
  n = gets.chomp.to_i
  a = gets.chomp.split.map(&:to_i)
  # n = 6
  # a = [1, 4, 3, 5, 6, 2]
  Sorting.insertion_sort2(a,n)
end

solve_challange2
