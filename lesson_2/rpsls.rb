# frozen_string_literal:true

system 'clear'

def prompt(message)
  puts "~*~*~*~*~> #{message}"
end

def abb
  puts 'R=Rock, P=Paper, S=Scissors, L=Lizard, Sp=Spock'
end

def abb_converter(ans)
  abb = { r: 'rock', p: 'paper', s: 'scissors', l: 'lizard', sp: 'spock' }
  abb[ans.to_sym]
end

def print_player_winner_phrases
  puts ["My God, man! You're good",
        'You have boldy gone where no man has gone before',
        "You're doing the impossible!"].sample
end

def print_computer_winner_phrases
  puts ['Resistance is futile!', 'Destroyed!', "You're going down!"].sample
end

def valid_choice?(choice)
  %w[r p s l sp].include?(choice.downcase)
end

def win?(first, second)
  win = { s: %w[p l], p: %w[r sp], r: %w[s l], l: %w[s p], sp: %w[s r] }
  win[first.to_sym].include?(second)
end

def print_description(user, comp)
  phrases = { %w[s p] => 'Scissors cuts Paper!', %w[s l] => 'Scissors decapitates Lizard!',
              %w[p r] => 'Paper covers Rock!', %w[p sp] => 'Paper disproves Spock!',
              %w[r s] => 'Rock crushes Scissors!', %w[r l] => 'Rock crushes Lizard!',
              %w[l sp] => 'Lizard poisens Spock!', %w[l p] => 'Lizard eats Paper!',
              %w[sp s] => 'Spock smashes Scissors!', %w[sp r] => 'Spock vaporizes Rock!' }
  phrases.select do |choices, description|
    puts description if choices.include?(user) && choices.include?(comp)
  end
end

rules = <<~MSG
  Scissors cuts Paper covers Rock crushes
  Lizard poisens Spock smashes Scissors
  decapitates Lizard eats Paper disproves
  Spock vaporizes Rock crushes Scissors

  Type any key to continue
MSG

welcome_message = <<~MSG
  ****Get those Spock brows ready...
  **It's time to play...
  **ROCK,PAPER,SCISSORS,LIZARD,SPOCK!

  Lets jump in.. type any key to continue
MSG

puts welcome_message
gets.chomp
system 'clear'

puts rules
gets.chomp
system 'clear'

got_it = <<~MSG
  Got it?
  Good!
  Let's begin!
  *
  *
  *
  *
  type any key to continue
MSG
puts got_it
gets.chomp
system 'clear'

loop do
  star_treck_characters = %w[Captain\ Kirk Spock Nyota Scotty Hikaru].sample
  prompt "You're playing against #{star_treck_characters}. Best out of 3"
  user_win_counter = 0
  computer_win_counter = 0

  loop do
    user_choice = ''
    loop do
      prompt "Execute! #{abb}"
      user_choice = gets.chomp
      system 'clear'
      break if valid_choice?(user_choice)

      prompt 'Try again..'
    end
    user_choice = user_choice.downcase

    computer_choice = %w[r p s l sp].sample

    prompt "You chose #{abb_converter(user_choice.to_s)}, and #{star_treck_characters}\
 chose #{abb_converter(computer_choice.to_s)}."

    print_description(user_choice, computer_choice) unless user_choice == computer_choice

    if win?(user_choice, computer_choice)
      user_win_counter += 1
      print_player_winner_phrases unless user_win_counter == 3
    elsif win?(computer_choice, user_choice)
      computer_win_counter += 1
      print_computer_winner_phrases unless computer_win_counter == 3
    else
      prompt 'A tie?! Shields up!'
    end

    display_scorecard = <<-MSG
    Scorecard
    You: #{user_win_counter}
    #{star_treck_characters}: #{computer_win_counter}
    MSG

    puts display_scorecard
    prompt 'You won! Highly illogical' if user_win_counter == 3
    prompt "You've been annihilated! Team #{star_treck_characters}!!" if computer_win_counter == 3
    break if user_win_counter == 3 || computer_win_counter == 3
  end
  prompt 'Challenge another character? y/n'
  ans = gets.chomp
  break unless ans.downcase.start_with? 'y'

  system 'clear'
end

prompt 'Live Long and Prosper'
