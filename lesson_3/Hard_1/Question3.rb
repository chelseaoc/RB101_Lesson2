def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

#This will output one is one,two is two, three is three. one two three are the same names as the parameter just to cause confusion.  the variables one two and three are passed into mess_with_vars as arguments of the method.  They are then reassigned to the parameter variables (passed by value) and the method is non-mutating: reassignment.  The original variables are then called on in the puts statements.

def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

#This is the same output with the same explanation as A

def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

#We are passing by reference here! This will output one is two,two is three,three is one bc we are executing a mutating method to the argument.
