
def list names
  names = names.map{|x| x[:name]}
  return names.first.to_s if names.length < 2
  return names.first + " & " + names[1] if names.length == 2
  
  last = names.pop
  names.join(", ") + " & #{last}"
end

list([ {name: 'Bart'}, {name: 'Lisa'}, {name: 'Maggie'} ])
# returns 'Bart, Lisa & Maggie'

list([ {name: 'Bart'}, {name: 'Lisa'} ])
# returns 'Bart & Lisa'

list([ {name: 'Bart'} ])
# returns 'Bart'

list([])
