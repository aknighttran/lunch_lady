
require "pry"
$VERBOSE = nil


@@main = [
  { dish: "Meatloaf", price: 5.00 },
  { dish: "Mystery Meat", price: 3.00 },
  { dish: "Slop", price: 1.00 }
]

@@side = [
  { dish: "Carrots", price: 1.75 },
  { dish: "Mystery Yogurt", price: 1.00 },
  { dish: "Beef Jerkey", price: 0.50 }
]

@@final = []


class Meal
  
  def initialize
    request
  end

  def request
    puts "What main dish would you like?"
    # binding.pry
    dish(@@main)
    puts "You can pick 2 side dishes. What is your 1st choice?"
    dish(@@side)
    puts "what is your 2nd choice?"
    dish(@@side)
    total
  end

  def dish(food)
    food.each_with_index do |item, i|
      puts "#{i + 1}) #{item[:dish]} - #{item[:price]}" 
    end
    print ">"
    choice = gets.to_i
    @@final << food[choice - 1]
  end

  def total
    puts "Your order consists of:"
    @@final.each do |item|
      puts "#{item [:dish]}"
    end
    total = @@final.sum { |h| h[:price]}
    puts "Your order total is $#{total}"
    exit
  end

end
 
meal = Meal.new
meal.request