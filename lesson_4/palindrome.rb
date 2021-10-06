def palindrome(word)
  loop do
    counter=1
    break if word.nil?
    while counter<word.length
      if word[0..counter]==word[0..counter].reverse
        puts word[0..counter]
      end
        counter+=1
    end
    break if word.length==1
    word=word[1..-1]
  end
end

palindrome("abcdcbaaskdwjhusfabcba")
palindrome("himynameismomanddadandiftotonlybobobobob")
palindrome("supercalifragilisticexpialidocious")
palindrome("abcddcbA")
palindrome("palindrome")
palindrome("")

