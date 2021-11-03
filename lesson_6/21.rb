GAME_TO_NUMBER = 21
COMPUTER_HIT_TO = 16

def prompt(message)
  puts "---->>#{message}"
end

def clear
  system 'clear'
end

# nested array of cards
def deck_initialize
  number = ['1', '2', '3', '4', '5', '6', '7', '8',
            '9', '10', 'Jack', 'Queen', 'King', 'Ace']
  suits = ['Diamonds', 'Hearts', 'Spades', 'Clubs']
  full_deck = []
  suits.map do |suit|
    number.map do |num|
      full_deck << [num, suit]
    end
  end
  full_deck
end

# assign values as hash with array(card) as key and values as value
def assign_values_to_cards(full_deck)
  hash_values = {}
  full_deck.map do |num, suit|
    if (1..10).map(&:to_s).include?(num)
      value = num.to_i
    elsif %w(Jack Queen King).include?(num)
      value = 10
    elsif num == 'Ace'
      value = 11
    end
    hash_values [[num, suit]] = value
  end
  hash_values
end

def show_all_cards(word, player_cards, points)
  puts "#{word} cards are.."
  puts '*********************'
  player_cards.keys.map { |num, suit| puts "#{num} of #{suit}" }
  puts "********************* VALUE of #{points}"
  yadayada
end

def a_an(num)
  if %w(8 Ace).include?(num)
    'an'
  else
    'a'
  end
end

# random pick for card
def pick_random_cards(full_deck)
  full_deck.sample
end

# deletes chosen cards from nested array
def delete_chosen_cards!(full_deck, choice)
  full_deck.delete(choice)
end

# Value of chosen card
def determine_value(hash, card)
  hash[card]
end

def yadayada
  2.times { puts "\n" }
end

def score(cards)
  total = cards.values.inject(:+)
  cards.map do |card, value|
    if card[0] == 'Ace' && value == 11 && total > GAME_TO_NUMBER
      cards[card] = 1
      total = cards.values.inject(:+)
    end
    cards
  end
  total = cards.values.inject(:+)
end

def player_points(player_cards, full_deck, hash)
  card = pick_random_cards(full_deck)
  player_cards[card] = determine_value(hash, card)
  delete_chosen_cards!(full_deck, card)
  score(player_cards)
end

# true/false bust?
def bust?(score)
  score > GAME_TO_NUMBER
end

clear
prompt "Welcome to #{GAME_TO_NUMBER}! Tournament is best out of 5."
puts 'Type any key to continue'
gets.chomp
clear

loop do
  comp_winner_count = 0
  user_winner_count = 0
  loop do
    full_deck = deck_initialize
    hash = assign_values_to_cards(full_deck)
    user_cards = {}
    comp_cards = {}
    # pick initial 2 cards for user and computer
    user_points = ''
    comp_points = ''
    loop do
      user_points = player_points(user_cards, full_deck, hash)
      comp_points = player_points(comp_cards, full_deck, hash)
      break if comp_cards.length == 2
    end
    # show results of first cards
    show_all_cards('Your', user_cards, user_points)
    puts "Dealer's first card is #{a_an(comp_cards.keys[0][0])}"
    puts '*********************'
    puts "#{comp_cards.keys[0][0]} of #{comp_cards.keys[0][1]}"
    puts "********************* VALUE of #{comp_cards.values[0]}"
    user_card_key_number = 1
    loop do
      answer = ''
      loop do
        yadayada
        prompt "Would you like to Hit or Stay?"
        answer = gets.chomp.downcase
        break if %w(s stay h hit).include?(answer)
        prompt 'Invalid Response'
      end
      break if %w(s stay).include?(answer)
      user_points = player_points(user_cards, full_deck, hash)
      if bust?(user_points)
        break
      end
      clear
      puts "Your card is #{a_an(user_cards.keys[user_card_key_number += 1])} \
#{user_cards.keys[user_card_key_number][0]} of \
#{user_cards.keys[user_card_key_number][1]}"
      show_all_cards('Your', user_cards, user_points)
      if comp_points == COMPUTER_HIT_TO
        comp_points = player_points(comp_cards, full_deck, hash)
        if bust?(comp_points)
          break
        end
      end
    end
    unless bust?(user_points)
      loop do
        break if comp_points == COMPUTER_HIT_TO
        comp_points = player_points(comp_cards, full_deck, hash)
        if bust?(comp_points)
          break
        end
      end
    end
    yadayada
    clear
    show_all_cards('Your', user_cards, user_points)
    show_all_cards("Dealer's", comp_cards, comp_points)
    if bust?(user_points)
      prompt 'You Bust! Dealer Wins!'
      comp_winner_count += 1
    elsif bust?(comp_points)
      prompt 'Dealer Bust! You Win!'
      user_winner_count += 1
    elsif comp_points == user_points
      prompt 'PUSH'
    elsif user_points > comp_points
      prompt 'You Win!'
      user_winner_count += 1
    else
      prompt 'Dealer Wins!'
      comp_winner_count += 1
    end
    puts '*********************'
    prompt "GAME SCORE: You: #{user_winner_count} Dealer: #{comp_winner_count}"
    yadayada
    prompt "Type any key to continue"
    gets.chomp
    clear
    if user_winner_count == 5
      prompt "You Win the Tournament!"
      break
    elsif comp_winner_count == 5
      prompt "Dealer Wins the Tournament!"
      break
    end
  end
  prompt "Do you want to play again?"
  answer = gets.chomp
  break if %w(n no).include?(answer.downcase)
  clear
end
prompt "Thanks for playing!"
yadayada
