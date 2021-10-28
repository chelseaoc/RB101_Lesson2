require "pry"
def clear
  system 'clear'
end

def prompt(message)
  puts "===> #{message}"
end

def board_initiate
  score = {}
  (1..9).each { |num| score[num] = ' ' }
  score
end

def delete_choices(available, pick)
  available.delete(pick)
end

def winner(hash, marker)
  wins = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
          [1, 4, 7], [2, 5, 8], [3, 6, 9],
          [1, 5, 9], [3, 5, 7]]
  win = wins.map do |subarray|
    arr = []
    subarray.select do |num|
      arr << hash.values_at(num)
      arr.flatten.count(marker) == 3
    end
  end
  true unless win.flatten.empty?
end

def display_board(hash)
  puts ' (1)         |(2)         |(3)         '
  puts "      #{hash[1]}      |     #{hash[2]}      |     #{hash[3]}       "
  puts '             |            |            '
  puts '--------------------------------------'
  puts ' (4)         |(5)         |(6)         '
  puts "      #{hash[4]}      |     #{hash[5]}      |     #{hash[6]}       "
  puts '             |            |            '
  puts '--------------------------------------'
  puts ' (7)         |(8)         |(9)         '
  puts "      #{hash[7]}      |     #{hash[8]}      |    #{hash[9]}        "
  puts '             |            |            '
end

clear

welcome = <<~MSG
  Welcome to Tic_Tac_Toe!
  You're X's..
  Are you ready? Good!
  Hit any key to continue..
MSG

puts welcome

gets.chomp

clear
loop do
  # set up blank hash with #1-9 keys
  score = board_initiate
  available_choices = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  # display initial board with empty score hash
  display_board(score)

  loop do
    choice = ''
    loop do
      prompt "Choose a space on the board for your move! #{available_choices}"
      choice = gets.chomp
      choice_conversion = { '1' => 1, '2' => 2, '3' => 3, '4' => 4,
                            '5' => 5, '6' => 6, '7' => 7, '8' => 8,
                            '9' => 9, 'one' => 1, 'two' => 2,
                            'three' => 3, 'four' => 4, 'five' => 5,
                            'six' => 6, 'seven' => 7, 'eight' => 8,
                            'nine' => 9 }
      choice = choice_conversion[choice]
      break if available_choices.include?(choice)
      prompt "Invalid entry"
    end

    clear

    delete_choices(available_choices, choice)
    score[choice] = 'X'
    display_board(score)
    if winner(score, 'X')
      prompt 'You win!'
      break
    elsif score.values.none?(' ')
      prompt "Cat's Game"
      break
    end

    computer_choice = available_choices.sample
    available_choices.delete(computer_choice)
    score[computer_choice] = 'O'
    clear
    display_board(score)

    if winner(score, 'O')
      prompt 'You lose!'
      break
    end
  end
  prompt "Do you want to play again? Yes/No"
  answer = gets.chomp
  clear
  break if %w(no n).include?(answer.downcase)
end
