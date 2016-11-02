

def hour_glas_sum_for(matrix, i, j)
  matrix[i][j] +     matrix[i][j + 1] + matrix[i][j + 2] +
                     matrix[i + 1][j + 1] +
  matrix[i + 2][j] + matrix[i + 2][j + 1] + matrix[i + 2][j + 2]
end

I = 6
J = 6

matrix = (0...I).map do |_row|
  gets.strip.split.map(&:to_i)
end

# less than the possible maximum of -9 x 3 x 3
max = - 82

(0...I - 2).each do |i|
  (0...J - 2).each do |j|
    max = [max, hour_glas_sum_for(matrix, i, j)].max
  end
end

puts max
