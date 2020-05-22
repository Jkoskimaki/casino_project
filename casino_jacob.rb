# Start game player has a name and an initial bankroll
# Player can go to different games via menu
# Slots
# High / Low
# Player places bet and wins / loses (hint: rand)
# Player's bankroll goes up and down with wins and losses

class Person
  attr_accessor :name, :bankaccount

  def initialize(name, bankaccount)   #initial method
    @name = name
    @bankaccount = bankaccount

  end
end

@cash = []


def high_low
  puts "high_low game"
end

@you_lose = 0
@you_won_something = 200
@you_won_big = 500


def pull_lever
  rand_num = rand(4)
  case rand_num
  when 1
    puts "lemon, grape, banana"
    puts "you lose $#{@you_lose}"
    @bankaccount = @bankaccount - @you_lose
    puts "Your bank value is now #{@bankaccount}"
    
  when 2
    puts "cherry, lemon, cherry"
    puts "You won $#{@you_won_something}!"
    @bankaccount = @bankaccount + @you_won_something
    puts "Your bank value is now #{@bankaccount}"

  when 3
    puts  "grape, lemon, cherry"
    puts "You won $#{@you_won_something}!"
    @bankaccount = @bankaccount + @you_won_something
    puts "Your bank value is now #{@bankaccount}"

  when 4
    puts "cherry, cherry, cherry"
    puts "You win big $#{@you_won_big}!"
    @bankaccount = @bankaccount + @you_won_big
    puts "Your bank value is now #{@bankaccount}"

  else 
    puts "try again"
    
  end
  game_menu
end



def intro
  puts 'Welcome to DevPoint Labs Casino!'
  puts "What is your name?"
  @name = gets.strip
  puts "How much you got in that bank account?"
  @bankaccount = gets.to_i

  puts "$#{@bankaccount} available: Welcome, #{@name.capitalize!}, lets get started!"
end

intro


def slots
  puts "How much money would you like to wager?"
  @cash = gets.chomp.to_i

  puts "Total cash: $#{@cash}"

  puts "Do you want to spin the lever?"
  puts "1). Yes"
  puts "2). No"
  choice = gets.to_i

  case choice
  when 1
  pull_lever
  when 2
  intro
  else
  puts "invalid choice try again"
  end

end

def high_low
  puts "this will be the high/low game"
end

def game_menu
  puts 'What would you like to play?'
  puts '1) Slots'
  puts '2) High/ Low'
  puts '3) Ive had enough!'
  
  user_input = gets.strip.to_i
  if user_input === 1
    slots
  elsif user_input === 2
    high_low
  elsif user_input === 3
    puts "thanks for playing!"
  else 
    intro
  end 
end

game_menu