# U2.W5: Class Warfare, Validate a Credit Card Number


# I worked on this challenge by myself (cjcjameson).

# 2. Pseudocode

# Input: initiate a CreditCard object with just one number/integer, the card.
    # Method call being check_card with no arguments
# Output:
# Steps: On initiation, raise an argumenterror if the card is not the right length
	# make the credit card number an instance variable
	# declare the check_card method
	# Compute the sums and MAP onto a new array to get the total
	# Include logic that appropriately transforms 8 x 2 = 16 into (1+6) = 7 (insert two items into the array instead of one??)
	# Return a boolean based on divisibility by 10



# 3. Initial Solution

# Don't forget to check on intialization for a card length
# of exactly 16 digits
class CreditCard
	def initialize(number)
		@card_digits = number.to_s.split('')
		@card_digits.map! { |n| n.to_i }
		raise ArgumentError, 'cards must be 16 digits long' unless @card_digits.length == 16
	end

	def check_card
		luhn_digits = []
		@card_digits.each_with_index.map { |digit, index|
			if index%2 == 0
				luhn_digits.push(digit*2/10)
				luhn_digits.push(digit*2%10)
			else
				luhn_digits.push(digit)
			end
		}
		luhn_sum = luhn_digits.reduce(:+)
		return luhn_sum % 10 == 0
	end
end



# 4. Refactored Solution






# 1. DRIVER TESTS GO BELOW THIS LINE

valid_card_1 = CreditCard.new(4444333322221111)
p valid_card_1.check_card

valid_card_2 = CreditCard.new(4111111111111111)
p valid_card_2.check_card

valid_card_3 = CreditCard.new(4563960122001999)
p valid_card_3.check_card

valid_card_rspec = CreditCard.new(4408041234567893)
p valid_card_rspec.check_card

invalid_card_1 = CreditCard.new(4388576018402625)
p !invalid_card_1.check_card

invalid_card_2 = CreditCard.new(4388576018402626)
p !invalid_card_2.check_card

invalid_card_rspec = CreditCard.new(4408041234567892)
p !invalid_card_rspec.check_card


# 5. Reflection 
