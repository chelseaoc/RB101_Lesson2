arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr.map do |subarray|
    p subarray.sort{|x,y| y<=>x}
end
