a=1
b=1
total=0
  while(b<10000)
    c=a+b
    if(c%2==0)
      total=total+c
    end
    a=b
    b=c
  end
puts total

