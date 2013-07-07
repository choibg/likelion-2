#encoding=utf-8
#화씨-섭씨 변환기 
def ctof (c)
  return c*9/5+32
end

def ftoc(f) 
  return(f-32)*5/9
end 

while true 
puts "1.C->F"
puts "2.F->C"
puts "3.quit" 
puts "Choose menu:"
c=gets.chomp.to_i 
  if c==1
    print "Input C:"
    puts "F is :" + ctof(gets.chomp.to_i).to_s
  elsif c==2
    print "Input F:"
    puts "C is:" +ftoc(gets.chomp.to_i).to_s
  elsif c==3 
    break;
  else 
    puts "Wrong number"
  end
end 
