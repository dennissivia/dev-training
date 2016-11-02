def whoIsNext(names, r)
  if r >= names.length
    i = r % names.length
  else
    i = r -1
  end
  names[i]
end

puts whoIsNext(["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 1)=="Sheldon"
puts "Sheldon"
puts whoIsNext(["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 1)
puts "========================="
puts whoIsNext(["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 52)=="Penny"
puts "Penny"
puts whoIsNext(["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 52)

puts "========================="
puts whoIsNext(["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 7230702951)=="Leonard"
puts "Leonard"
puts whoIsNext(["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 7230702951)
