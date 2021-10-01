def fib(num)
  return num if num<2
  fib(num-2)+fib(num-1)
end

puts fib(9)

def fib2(num1,num2)
  limit=15
  while num1+num2<limit
      sum=num1+num2
      num1=num2
      num2=sum
  end
  sum
end

result=fib2(0,1)
puts "result is #{result}"

#The limit variable was out of scope in regards to the fib2 method.  We had to initiate the variable within the fib2 method to make it accessible 


