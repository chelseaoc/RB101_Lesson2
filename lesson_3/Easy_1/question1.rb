numbers=[1,2,2,3]
numbers.uniq

puts numbers

#I would expect the code to print out
#1
#2
#3
#4
#5
#uniq was not called with ! to mutate the obj

#puts calls .to_s on arguments
