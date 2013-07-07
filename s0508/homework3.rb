def box_check(val1, val2, val3)
  a=[val1, val2, val3].sort
  return a[0]+a[1]>a[2]
end

while true
print "input1:"
v1=gets.chomp.to_i
print "input2:"
v2=gets.chomp.to_i
print "input3:"
v3=gets.chomp.to_i
  if box_check(v1, v2, v3)
    puts "Triangle"
  else
    puts "Not triangle"
  end
end
