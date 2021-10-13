numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

#1,3 This would iterate over position [0] and then remove position [0] making 2 in position [0]. It would then iterate over position [1] and skip every other one entirely.

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

#1,2 Each time this went through an iteration ir would pop off the last number..thus halving this array length
