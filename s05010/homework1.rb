def find_kth_number(input_array, input_k)
    a=input_array.sort.reverse!
    puts a[input_k-1]
end 

kth=find_kth_number([2,3,4,5,6,7,8],3)
  puts kth
kty=find_kth_number([345,234,756,23,64,123,214],2)
  puts kty
