
def oddNumbers(l, r)
  start = l.odd? ? l : l +1
  (start..r).step(2).to_a
end

puts oddNumbers(2,18).inspect

