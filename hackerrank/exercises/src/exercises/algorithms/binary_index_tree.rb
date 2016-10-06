class BinaryIndexTree
  def initialize(size)
    @size = size
    @sums = Array.new(@size + 1){ 0 }
  end

  def sum(i)
    s = 0
    i = i.succ
    while i > 0 do
      s += @sums[i]
      i -= i & (-i)
    end
    s
  end

  def update(i, v)
    i = i.succ
    while i <= @size
      @sums[i] += v
      i += i & (-i)
    end
  end

  def self.from_array(arr)
    n = arr.length
    tree = new(n + 1)

    arr.each_with_index do |v, i|
      tree.update(i, v)
    end
    tree
  end
end

def count_inversions_naive(arr)
  inv = 0
  m   = max(arr)
  n   = arr.length

  # BIT with size MaxElement + 1
  tree = BinaryIndexTree.new(m)
  (n - 1).downto(0).each do |i|
    inv += tree.sum(arr[i] - 1)
    tree.update(arr[i], 1)
  end
  inv
end

# Converts an array to an array with values from 1 to n
# and relative order of smaller and greater elements remains
# same.  For example, {7, -90, 100, 1} is converted to
# {3, 1, 4 ,2 }
def convert(arr)
  # Create a copy of arrp[] in temp and sort the temp array
  # in increasing order
  n = arr.length
  temp = arr.sort

  lookup_tbl = {}
  0.upto(n - 1) do |i|
    lookup_tbl[temp[i]] = i
    # arr[i] = temp.find_index(arr[i]) + 1
    # unless hsh.key?(temp[i])
      # puts "storing #{i} at hsh index #{temp[i]}"
      # hsh[i+1] = temp[i]
    # end
  end
  # puts temp.inspect
  # puts lookup_tbl.inspect
  # puts arr.inspect
  0.upto(n - 1) do |i|
    # puts "looking up #{i} in #{hsh.inspect}"
    # puts "OLD was setting #{arr[i]} to #{temp.find_index(arr[i])} at idx #{i}"
    # puts "NEW setting #{arr[i]} to #{hsh[temp[i]]} at idx #{i}"
    arr[i] = lookup_tbl[arr[i]]
  end

  arr
end

def count_inversions(arr)
  a2 = convert(arr)
  count_inversions_naive(a2)
end

def max(arr)
  arr.inject(0) do |max, x|
    if x > max
      x
    else
      max
    end
  end
end

def exercise1
  freq = [2, 1, 1, 3, 2, 3, 4, 5, 6, 7, 8, 9]
  tree = BinaryIndexTree.from_array(freq)

  puts("Sum of elements in arr[0..5] is #{tree.sum(5)}")
  freq[3] += 6
  tree.update(3, 6)
  puts("Sum of elements in arr[0..5] is #{tree.sum(5)}")
end

def exercise2
  arr = [ 8, 4, 2, 1 ]
  puts "Number of inversions are:  #{count_inversions(arr)}"
end

def exercise3
  t = gets.chomp.to_i
  t.times do
    _n  = gets.chomp.to_i
    arr = gets.chomp.split.map(&:to_i)
    puts count_inversions(arr)
  end
end
exercise3
