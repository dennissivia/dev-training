module Sorting
  # hackerrank sorting tutorial insertion sort 1
  # insert the last element of an array into the
  # correct position
  def insertion_sort1(a, n)
    tmp = a.last
    cur = n - 1
    while cur > 0 && a[cur - 1] > tmp
      a[cur] = a[cur - 1]

      cur -= 1
      puts a.join(' ')
    end
    a[cur] = tmp
    a
  end
  module_function :insertion_sort1


  # hackerrank sorting tutorial insertion sort 1
  # insert the last element of an array into the
  # correct position
  def insertion_sort2(a, pos)
    tmp = a[pos]
    cur = pos
    while cur > 0 && a[cur - 1] > tmp
      a[cur] = a[cur - 1]

      cur -= 1
      # puts a.join(' ')
    end
    a[cur] = tmp
    a
  end
  module_function :insertion_sort2
end

def solve_challange1
  n = gets.chomp.to_i
  a = gets.chomp.split.map(&:to_i)
  a = Sorting.insertion_sort1(a, n)
  puts a.join(' ')
end

def solve_challange2
  # n = gets.chomp.to_i
  # a = gets.chomp.split.map(&:to_i)
  n = 6
  a = [1, 4, 3, 5, 6, 2]

  (1..n-1).to_a.each do |i|
    a = Sorting.insertion_sort2(a, i)
    puts a.join(' ')
  end
end

solve_challange2
