
d, m, y    = gets.strip.split.map(&:to_i)
d2, m2, y2 = gets.strip.split.map(&:to_i)

returned_at = Time.mktime(y,m,d)
expected_at = Time.mktime(y2,m2,d2)

if returned_at <= expected_at
  puts 0
else
  if expected_at.year == returned_at.year
    if expected_at.month == returned_at.month
      puts 15 * (returned_at.day - expected_at.day)
    else
      puts 500 * (returned_at.month - expected_at.month)
    end
  else
    puts 10000
  end

end
