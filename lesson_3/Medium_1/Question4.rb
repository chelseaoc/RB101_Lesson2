def rolling_buffer(array,num,max)
    array<<num
    array.shift if array.size>max
    array
end

x=[]

print rolling_buffer(x,8,3)
print rolling_buffer(x,7,3)
print rolling_buffer(x,3,3)
print rolling_buffer(x,1,3)
