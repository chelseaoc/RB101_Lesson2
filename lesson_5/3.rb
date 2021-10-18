arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

#accessing "g"
arr1.map do |arr2|
  if arr2.size !=1
      arr2.map do |arr3|
          if arr3.size!=1
              arr3.map do |arr4|
                  p arr4 if arr4=='g'
              end
          end
      end
    end
end

arr1[2][1][3]
    
arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]

arr2[1][:third][0]


arr3 = [['abc'], ['def'], {third: ['ghi']}]

arr3[2][:third][0][0]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

hsh1['b'][1]

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
                
hsh2[:third].key(0)

