hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |key,value|
    value.each do |word|
        word=word.chars
        word.each do |letter|
            puts letter if (%w(a e i o u)).include? letter
        end
    end
end


