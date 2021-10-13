words = "the flintstones rock"

def titleize(phrase)
    print phrase.split.map!{|word| word.capitalize}.join(" ")
end

titleize(words)
    
