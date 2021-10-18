def hex
    array=[]
    (0..9).each{|num| array<<num.to_s}
    ("a".."f").each{|letter| array<<letter}
    8.times{print array.sample}
    print "-"
    counter=0
    loop do
        4.times{print array.sample}
        print "-"
        counter+=1
        break if counter==3
    end
    12.times{print array.sample}
    puts " "
end

hex
    

