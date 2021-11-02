require "pry"
# nested array
def prompt(message)
  puts "---->>#{message}"
end

def clear
  system 'clear'
end

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

# assign values to deck
def assign_values_to_cards(full_deck)
  hash_values = {}
  full_deck.map do |num, suit|
    if (1..10).map(&:to_s).include?(num)
      value = num.to_i
    elsif %w(Jack Queen King).include?(num)
      value = 10
    end
    hash_values [[num, suit]] = value
  end
  hash_values
end

# prints out card choice
def print_your_card_is(user, card)
  num = card[0]
  suit = card[1]
  prompt "#{user} card is #{a_an(num)} #{num} of #{suit}"
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
def determine_value(hash, card, score)
  if card[0] == 'Ace'
    if score > 10
      1
    else
      11
    end
  else
    hash[card]
  end
end

def yadayada
  print <<~MSG
  -  -  -  -  -  -  -  -
  -  -  -  -  -  -  -  -
  -  -  -  -  -  -  -  -
  -  -  -  -  -  -  -  -
  MSG
end

# true/false bust?
def bust?(score)
  score > 21
end

# print message
def print_winner_message(comp_points, user_points)
  if bust?(comp_points) && bust?(user_points)
    prompt "Both Busted! TIE"
  elsif comp_points == user_points
    prompt "TIE"
  elsif bust?(comp_points)
    prompt "Dealer Busts! You Win!"
  elsif bust?(user_points)
    prompt "You Bust! Dealer Wins!"
  elsif user_points > comp_points
    prompt "You Win!"
  else
    prompt "Dealer Wins!"
  end
end

clear
prompt "Welcome to 21! Type any key to continue"
gets.chomp
clear
loop do
  full_deck = deck_initialize
  hash = assign_values_to_cards(full_deck)
  user_points = 0
  comp_points = 0
  user_cards = {}
  comp_cards = {}
  # pick initial 2 cards for user and computer
  loop do
    card = pick_random_cards(full_deck)
    user_cards[card] = determine_value(hash, card, user_points)
    delete_chosen_cards!(full_deck, card)
    card = pick_random_cards(full_deck)
    comp_cards[card] = determine_value(hash, card, comp_points)
    delete_chosen_cards!(full_deck, card)
    break if user_cards.length == 2 && comp_cards.length == 2
  end
  # show results of first cards
  print_your_card_is('Your first', user_cards.keys[0])
  print_your_card_is('Your second', user_cards.keys[1])
  user_points = user_cards.values.inject(:+)
  puts "You have a total value of #{user_points}"
  yadayada
  print_your_card_is("Dealer's first", comp_cards.keys[0])
  yadayada
  comp_points = comp_cards.values.inject(:+)
  if bust?(user_points)
    break
  elsif bust?(comp_points)
    break
  end
  user_card_key_number = 1
  loop do
    answer = ''
    loop do
      prompt "Would you like to Hit or Stay?"
      answer = gets.chomp.downcase
      break if %w(s stay h hit).include?(answer)
      prompt 'Invalid Response'
    end
    break if %w(s stay).include?(answer)
    card = pick_random_cards(full_deck)
    user_cards[card] = determine_value(hash, card, user_points)
    delete_chosen_cards!(full_deck, card)
    clear
    print_your_card_is('Your', user_cards.keys[user_card_key_number += 1])
    user_points = user_cards.values.inject(:+)
    prompt "You have a total value of #{user_points}"
    if bust?(user_points)
      break
    end
    if comp_points <= 17
      card = pick_random_cards(full_deck)
      comp_cards[card] = determine_value(hash, card, comp_points)
      delete_chosen_cards!(full_deck, card)
      comp_points = comp_cards.values.inject(:+)
      if bust?(comp_points)
        break
      end
    end
  end
  if comp_points <= 17
    loop do
      break if comp_points >= 17
      card = pick_random_cards(full_deck)
      comp_cards[card] = determine_value(hash, card, comp_points)
      delete_chosen_cards!(full_deck, card)
      comp_points = comp_cards.values.inject(:+)
      if bust?(comp_points)
        break
      end
    end
  end
  yadayada
  clear
  prompt "You have a total value of #{user_points}"
  prompt "Dealer has a total value of #{comp_points}"
  yadayada
  print_winner_message(comp_points, user_points)
  prompt "Play Again?"
  answer = gets.chomp.downcase
  break if %w(n no).include?(answer)
  clear
end
