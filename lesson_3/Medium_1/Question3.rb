def factors(number)
    divisor=number
    factors=[]
   while divisor>0 do
    factors<<number/divisor if number %divisor ==0
    divisor-=1
  end
    factors
end

puts factors(6)
puts factors(0)

#in a method the last line will be returned so you need to return the array to output the array

#alternate method that handles 0 and negative numbers

def factors2(num)
  if num>0
    (1..num).select{|x|  num%x==0}
  elsif num<0
    (num...0).select{|x|num%x==0}
  else
    0
  end
end
    
puts factors2(12)
puts factors2(-12)
puts factors2(0)
