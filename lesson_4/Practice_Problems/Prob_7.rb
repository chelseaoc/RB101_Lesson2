statement = "The Flintstones Rock"
letters=("A".."Z").to_a + ("a".."z").to_a
result={}
letters.each do |letter|
    frequency=statement.count(letter)
    if frequency>0 then result[letter]=frequency
    end
end

puts result

#Count method for string class/ adds up the argument you pass into it 
