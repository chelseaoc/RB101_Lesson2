def dot_separated_ip_address?(input_string)
    dot_separated_words=input_string.split(".") #we have an array of strings
    
    return false unless dot_separated_words.size==4
    while dot_separated_words.size>0 do  #determining length of array
        word=dot_separated_words.pop  #popping off and returning last array value
        return false unless is_an_ip_number?(word)
    end
    true
end
    
    
puts dot_separated_ip_address?("1212.4325.43242")
