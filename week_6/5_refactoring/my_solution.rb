# U2.W6: Refactoring for Code Readability


# I worked on this challenge by myself.


# Original Solution from Dominick Oddo (oddomatic) who worked on it with Andra Lally

# class CreditCard

#   def initialize(card_number)
#     @card_number = card_number.to_s.split('')
#     if @card_number.length != 16
#       raise ArgumentError.new("That is not a correct card number.")
#     end
#   end
 
#   def check_card
#     i = 14
#     while i >= 0
#       @card_number[i] = (@card_number[i].to_i * 2).to_s.split("")
#       i -=2
#     end
#     @card_number.flatten!.inject {|sum,x| sum.to_i + x.to_i} % 10 == 0
   
   
#   end
# end

# card = CreditCard.new(4563960122001999)
# puts card.check_card == true
# puts card.method(:initialize).arity == 1
# false_card = CreditCard.new(4563960122001998)
# puts puts false_card.check_card == false


# Refactored Solution

class CreditCard

  def initialize(card_number)
    @card_number = card_number.to_s.split("") #using double quotes to be consistent with the below
    if @card_number.length != 16
      raise ArgumentError.new("Card numbers need to be 16 digits long") #more specific error message
    end
  end
 
  def check_card
    i = 0 #switched this to increment increasing
    while i < @card_number.length 
      @card_number[i] = (@card_number[i].to_i * 2).to_s.split("")
      i +=2
    end
    @card_number.flatten! #expanded these lines so that each line is doing its own thing
    sum = @card_number.inject {|sum,x| sum.to_i + x.to_i}
    return sum % 10 == 0
  end
end






# DRIVER TESTS GO BELOW THIS LINE

card = CreditCard.new(4563960122001999)
puts card.check_card == true
puts card.method(:initialize).arity == 1
false_card = CreditCard.new(4563960122001998)
puts false_card.check_card == false #cleared extra puts here




# Reflection

# This was pretty compact and efficient code, a testament to how pair programming helps make sure the output is solid!
# Some minor tweaks I made to make this be more sensical to me, in one place expanding the code to make it clearer.