# U2.W6: Testing Assert Statements

# I worked on this challenge by myself (cjcjameson).


# 2. Review the simple assert statement

# def assert
#   raise "Assertion failed!" unless yield
# end

# name = "bettysue"
# assert { name == "bettysue" }
# assert { name == "billybob" }

# 2. Pseudocode what happens when the code above runs

# define method using the special word assert which leaves an error for the program program unless the codeblock == true
# the first assert is true but the second isn't, so the code throws the error
# COOL THING: It doesn't stop the rest of the program from working

# 3. Copy your selected challenge here

class RPNCalculator
 	 def evaluate(expression)
      		expression = expression.split(' ')
         	expression.map! { |x|
            if !!(x=~/^[+-]?[0-9]+$/)
                x.to_i
            else
                x
            end
          	}

      	until expression.length == 1 do
      		operator_index = expression.index{|x| x == '+' || x == '-' || x == '*'}
      		case expression[operator_index]
          	when '+'
            	inject_value = expression[operator_index - 2] + expression[operator_index - 1]
          	when '-'
            	inject_value = expression[operator_index - 2] - expression[operator_index - 1]
          	when '*'
            	inject_value = expression[operator_index - 2] * expression[operator_index - 1]
          	else
             	puts "oops! not an operand... "
          	end
          	expression[operator_index] = inject_value
          	expression.slice!(operator_index - 2, 2)
        end

        return expression[0]
    end
end
 rpn = RPNCalculator.new

# old DRIVER TESTS GO BELOW THIS LINE
rpn = RPNCalculator.new
p rpn.evaluate('1 2 3 4 + + +') == 10
p rpn.evaluate('2 2 *') == 4
p rpn.evaluate('1 2 + 3 4 + *') == 21


# 4. Convert your driver test code from that challenge into Assert Statements

def assert
	raise "RPN Fail!" unless yield 
end

assert { rpn.evaluate('1 2 3 4 + + +') == 10 }
assert { rpn.evaluate('2 2 *') == 4 }
assert { rpn.evaluate('1 2 + 3 4 + *') == 21 }



# 5. Reflection

# I didn't realize at first that it wouldn't stop the code from working. But I see that it doesn't, so the rest of the driver tests are run!
# What if you want different error messages for different asserts? Can you define different code block things, or does it really truely have to be called assert?
