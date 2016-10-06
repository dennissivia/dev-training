module Sorting
  # hackerrank sorting tutorial insertion sort 2
  def insertion_sort3(a, n)
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
    puts shifts
  end
  module_function :insertion_sort3
end

def solve_challange3
  n = gets.chomp.to_i
  a = gets.chomp.split.map(&:to_i)
  # n = 6
  # a = [1, 4, 3, 5, 6, 2]
  # n = 12
  # a =  [1, 1, 2, 2, 3, 3, 5, 5, 7, 7, 9, 9]
  Sorting.insertion_sort3(a,n)
end

solve_challange3
