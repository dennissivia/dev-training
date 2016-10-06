# The dynamic programming solution is based on a
# n x W matrix with W columns and n rows
# each rows solves the knapsack for a subproblem of #row amount of items
# The values of the cells are calculated based on the solution of earlier
# rows ( subproblem with less items and capacity )

# weight, value
def knapsack(capacity = 10, items = [[6,30], [3,14], [4,16], [2,9]])
  n = items.length
  result = Array.new(n){ Array.new(capacity+1,0) }

  (0..(n-1)).each do |i|
    (0..(capacity)).each do |w|
      # does the item fit into the knapsack with size w ?
      if items[i].first > w
        result[i][w] = result[i-1][w]
      else
        new_val = result[i-1][w - items[i][0]] + items[i][1]
        old_val = result[i-1][w]

        result[i][w] = [old_val, new_val].max
      end
    end
  end
  result
end

def assignment
  w, n = gets.chomp.split.map(&:to_i)
  nums = gets.chomp.split.map(&:to_i)
  items = nums.zip(nums)
  result = knapsack(w, items)
  puts result.last.last
end

assignment
