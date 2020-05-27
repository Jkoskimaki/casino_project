# Start game player has a name and an initial bankroll
# Player can go to different games via menu
# Slots
# High / Low
# Player places bet and wins / loses (hint: rand)
# Player's bankroll goes up and down with wins and losses

class Deck
  # Getter and Setter methods for rank, suit and color
  attr_accessor :cards
 
  # Gets called when you call the new method to create an instance
  # deck = Deck.new
  def initialize
    @ranks = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
    @suits = %w(Spades Diamonds Clubs Hearts)
    @cards = []
    generate_deck
  end
 
  def shuffle_cards
   @cards.shuffle
  end
  
  def generate_deck
    @suits.each do |suit|
      @ranks.size.times do |i|
        # Ternary Operator
        color = (suit == 'Spades' || suit == 'Clubs') ? 'Black' : 'Red' 
        @cards << Card.new(@ranks[i], suit, color)
      end
    end
  end
 
   def display_cards
     @cards.shuffle.each do |card|
       puts "#{card.rank} #{card.suit} (#{card.color})"
     end
   end
 end

 def high_low
  number = rand(1..10)
  puts "Guess the correct number between 1 and 10:"
  loop do 
    user_input = gets.chomp.to_i
    if user_input == number
      puts "You picked the correct number!"
      break
    elsif user_input > number
      puts "The number is lower, try again."
    else
      puts "The number is higher, try again."
    end
  end
end
high_low


class Person
  attr_accessor :name, :bankaccount

  def initialize(name, bankaccount)   #initial method
    @name = name
    @bankaccount = bankaccount
  end

  def update_account
    @bankaccount = @bankaccount + @change
  end
end

@cash = []



@you_lose = 0
@you_won_something = 200
@you_won_big = 500


def pull_lever 
  rand_num = rand(4)
  case rand_num
  when 1
    puts "lemon, grape, banana"
    @change = 0
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