answer=42
def mess_with_it(some_number)
    some_number+=8
end

new_answer=mess_with_it(answer)

p answer-8

#The output will be 34.  Numbers are immutable and are passed into methods similar to pass by value.  The answer variable is unchanged by the method.
