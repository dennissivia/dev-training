

price = gets.chomp.to_f
tax = gets.chomp.to_f / 100.0
tip = gets.chomp.to_f / 100.0

final_price = (price + price * tax + price * tip).round

puts "The total meal cost is #{final_price} dollars."
