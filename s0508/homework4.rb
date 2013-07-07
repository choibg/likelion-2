def isNotDivisor?(int, d)
  return int%d!=0
end 

def notDivisors(int1, int2)
  if int1<2 or int2<2
   return  puts "erro : a parameter is less than 2"     
  end
a=[int1, int2].sort 
  1.upto(a[0]) do |x|
    puts x if isNotDivisor?(int1,x) and isNotDivisor?(int2, x)
  end
end
while true
  print "input1:"
  val1=gets.chomp.to_i
  print "input2:"
  val2=gets.chomp.to_i
  notDivisors(val1,val2)
end
