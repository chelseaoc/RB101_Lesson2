def integer_rows(num)
  array = []
  if num==0
    puts num
  elsif num.is_a? Integer
    number = num * (num+1)
    array << number
    loop do
      number = number-2
      array << number
      break if array.size == num
    end
    sum = 0
    array.map{|x| sum += x}
    puts sum
  else
    puts "Invalid entry"
  end
end

integer_rows(6)
integer_rows(0)
integer_rows("abc")
integer_rows("")
integer_rows(957345)

