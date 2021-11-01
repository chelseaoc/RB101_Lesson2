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

def joinor(array, punc, word)
  array_s = array.map { |num| num.to_s }
  if array.length == 1
    print array_s[0]
  else
    print array_s[0..array_s.length-2].join(punc+ ' ') + ' ' + punc + ' ' + word + ' ' + array_s[array_s.length-1] + "\n"
  end
end

def delete_choices(available, pick)
  available.delete(pick)
end

def wins
  wins = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
          [1, 4, 7], [2, 5, 8], [3, 6, 9],
          [1, 5, 9], [3, 5, 7]]
end

def winner(hash, marker)
  wins
  win = wins.map do |subarray|
    arr = []
    subarray.select do |num|
      arr << hash.values_at(num)
      arr.flatten.count(marker) == 3
    end
  end
  true unless win.flatten.empty?
end

def off_def(hash, marker)
  wins
  chosen=wins.select do |subarray|
    arr=[]
    subarray.map do |num|
      arr<< hash.values_at(num)
    end
    arr=arr.flatten
    if arr.count(marker) == 2 && arr.count(' ') == 1
      true
    end
  end
end

def get_move(hash, player, avail_choices)
  player
  get_defense = player.map{|num| hash.values_at(num)}
  number=get_defense.flatten.find_index(' ')
  hash[player[number]] = 'O'
  delete_choices(avail_choices,(player[number]))
end

def defense(hash, avail_choices)
  user=off_def(hash, 'X').flatten
  computer=off_def(hash, 'O').flatten
  if user.empty? && computer.empty?
    if hash[5] == ' '
      hash[5] = 'O'
      delete_choices(avail_choices, 5)
    else
      ac = avail_choices.sample
      hash[ac]='O'
      delete_choices(avail_choices, ac)
    end
  elsif computer.empty?
    get_move(hash,user, avail_choices)
  else
    get_move(hash, computer, avail_choices)
  end
  clear
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

def user_turn(score, available_choices)
  choice = ''
  loop do
    prompt "Choose a space on the board for your move!"
    joinor(available_choices, ",", "or")
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
end

def player_order
  loop do
    prompt 'Who do you want to go first? Type 1 for you or 2 for computer'
    start=gets.chomp.downcase
    if ['1', '2', 'one', 'two'].include?(start)
      return start
    else
      prompt 'Invalid response.'
    end
  end
end

clear

welcome = <<~MSG
  Welcome to Tic_Tac_Toe!
  You're X's..
  First one to 5 wins!
  Are you ready? Good!
  Hit any key to continue..
MSG

puts welcome

gets.chomp

clear
loop do
  user_win_count = 0
  computer_win_count = 0
  loop do
    # set up blank hash with #1-9 keys
    score = board_initiate
    # display initial board with empty score hash
    display_board(score)
    available_choices=[1,2,3,4,5,6,7,8,9]
    start=player_order
    clear
    display_board(score)
    loop do
      if %w(1 one).include?(start)
        user_turn(score, available_choices)
        display_board(score)
        if winner(score, 'X')
          prompt 'You Win!'
          user_win_count+=1
          break
        elsif score.values.none?(' ')
          prompt "Cat's Game"
          break
        end

        clear
        defense(score, available_choices)
        display_board(score)
        if winner(score, 'O')
          prompt 'You lose!'
          computer_win_count+=1
          break
        end
      else
        defense(score, available_choices)
        display_board(score)

        if winner(score, 'O')
          prompt 'You lose!'
          computer_win_count+=1
          break
        elsif score.values.none?(' ')
          prompt "Cat's Game"
          break
        end
        user_turn(score, available_choices)
        if winner(score, 'X')
          prompt 'You Win!'
          user_win_count+=1
          break
        end
      end
    end
    puts "Score=> You: #{user_win_count} Computer=> #{computer_win_count}"
    puts "Press any key to continue"
    gets.chomp
    clear
    break if [user_win_count, computer_win_count].include? (5)
  end
  prompt "Do you want to play again? Yes/No"
  answer = gets.chomp
  clear
  break if %w(no n).include?(answer.downcase)
end
