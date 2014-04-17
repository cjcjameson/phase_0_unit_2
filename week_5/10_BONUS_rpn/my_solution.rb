# U2.W5: Implement a Reverse Polish Notation Calculator


# I worked on this challenge C.J. Jameson. Devin Johnson

# 2. Pseudocode

# Input: Into our main method 'evaluate', we expect a string containing both positive and negative and operators '+', '-' and '*' all separated by a single space.
# Output: A single number value that is the output of the calculation
# Steps:
=begin
    DEFINE method 'evalute' which takes string as an argument
        split argument string at each ' ' and save into new array
        convert all strings containing number values to integers
        IF there are 3 elements in array
            evaluate elements using case statements depending on +, - or *
        ELSE
            look through the array until a '+' '-' or '*' is found
            select that position, plus the two preceding positions
            call evaluate on those three elements
            replace those elements with the output of their evaluation
=end

# 3. Initial Solution

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


# 4. Refactored Solution

=begin
Devin refactored the code some, so as a reflection, I'm going to  talk through what he did
He split the expression directly into itself, which is great/fine.
He finds the first operator as we had before, and keeps the same case switch structure
I might do something different with inject_value, rather than re-declaring it
	every single time
He puts the inject_value into the slot where the operator was, and then removes
the two previous numbers.
=end




# 1. DRIVER TESTS GO BELOW THIS LINE
rpn = RPNCalculator.new
p rpn.evaluate('1 2 3 4 + + +') == 10
p rpn.evaluate('2 2 *') == 4
p rpn.evaluate('1 2 + 3 4 + *') == 21