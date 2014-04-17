# U2.W4: Cipher Challenge


# I worked on this challenge with Parjam Davoody and C.J. Jameson (half of our group).



# 1. Solution
# Write your comments on what each thing is doing. 
# If you have difficulty, go into IRB and play with the methods.



def north_korean_cipher(coded_message)
  input = coded_message.downcase.split("") # Check out this method in IRB to see how it works! Also refer to the ruby docs.
            # split is typically used to demarcate words, but by calling it with '' here, it's creating
            # an array with one character in each slot.
  decoded_sentence = []
  cipher = {"e" => "a",   # This is technically a shift of four letters...Can you think of a way to automate this? Is a hash
            "f" => "b",   # the best data structure for this problem? What are the pros and cons of hashes? 
            "g" => "c", 
            "h" => "d",   # We think we should use a "shift" kind of method
            "i" => "e",   # it seems like this is more of a function/method call, rather than a hash
            "j" => "f",   # because it's manipulating the data in a predictable way
            "k" => "g",
            "l" => "h",   # a hash is good for random look-up of poorly organized data, keys and values
            "m" => "i",   # but here we have a predictable structure of regular inputs and outputs
            "n" => "j",   # which we can use a method for
            "o" => "k",
            "p" => "l",
            "q" => "m",
            "r" => "n",
            "s" => "o",
            "t" => "p",
            "u" => "q",
            "v" => "r",
            "w" => "s",
            "x" => "t",
            "y" => "u",
            "z" => "v",
            "a" => "w",
            "b" => "x",
            "c" => "y",
            "d" => "z"}
            
  input.each do |x| # What is #each doing here?
                    # EACH is iterating through all of the characters in the input (now an array)
    found_match = false  # Why would this be assigned to false from the outset? What happens when it's true?
                # this is the starting point for the if-else structures, starting false
                # the later code sets it to true once a character has been inserted into
                # the decoded sentence array.
                # Then finally if nothing has been added, such as miscellaneous common punctuation
                # like commas, periods, or exclamation points, it makes sure it's added in.
    cipher.each_key do |y| # What is #each_key doing here?
                # it loops through the cipher hash, searching for the letter we want to decrypt
      if x == y  # What is this comparing? Where is it getting x? Where is it getting y? What are those variables really?
                # x is the input array string value
                # y is the different possible keys from our cipher hash
                # it's comparing the two, and once there's a match, it'll translate them.
        puts "I am comparing x and y. X is #{x} and Y is #{y}."
        decoded_sentence << cipher[y]
        found_match = true
        break  # Why is it breaking here?
                # This breaks the cipher hash loop once it finds the proper letter to decrypt
      elsif x == "@" || x == "#" || x == "$" || x == "%"|| x == "^" || x == "&"|| x =="*" #What the heck is this doing?
                    # This is checking for strange symbols (less common ones), which seem to be indicating spaces
        decoded_sentence << " "
        found_match = true
        break
      elsif (0..9).to_a.include?(x) # Try this out in IRB. What does   " (0..9).to_a "    do?
                    # this expands the 0..9 numbers notation into proper array notation, which allows .include? to be called on it
        decoded_sentence << x
        found_match = true
        break
      end 
    end
    if not found_match  # What is this looking for?
                        # This looks for other characters, namely, common punctuation in this case,
                        # which are not encrypted, and adds them to the decoded array
      decoded_sentence << x
    end
  end
  decoded_sentence = decoded_sentence.join("")
 
  if decoded_sentence.match(/\d+/) #What is this matching? Look at Rubular for help.
  #If the decoded answer has a number or digits anywhere in it, then it does the next thing.
    decoded_sentence.gsub!(/\d+/) { |num| num.to_i / 100 } #He's been known to exaggerate...
    # Wherever there is portion of decoded sentence that is a number, take that number and then turn in into an integer and then put it back.
  end  
  return decoded_sentence # What is this returning? its returning the decoded sentence.        
end

# Your Refactored Solution

def north_korean_cipher(coded_message)
  input = coded_message.downcase.split("") 
  decoded_sentence = ""
  input.each do |x|
    if x.match(/[a-z]/)
        decoded_sentence += x.tr('a-z','w-z'+'a-v')
    elsif x == "@" || x == "#" || x == "$" || x == "%"|| x == "^" || x == "&"|| x =="*" 
        decoded_sentence += " "
    else
      decoded_sentence += x
    end
  end
  # decoded_sentence = decoded_sentence.join("") because we redefine decoded_sentence as
  # a string from the get-go, we don't need to join it together at the end.
  if decoded_sentence.match(/\d+/) 
    decoded_sentence.gsub!(/\d+/) { |num| num.to_i / 100 }
  end  
  return decoded_sentence       
end


# Driver Code:
p north_korean_cipher("m^aerx%e&gsoi!") == "i want a coke!" #This is driver code and should print true
# Find out what Kim Jong Un is saying below and turn it into driver code as well. Driver Code statements should always return "true"
p north_korean_cipher("syv#1000000#tvsjmxefpi$jevqw.") == "our 10000 profitable farms."
p north_korean_cipher("*hsr'x%xipp&xli#yw!") == " don't tell the us!"
p north_korean_cipher("r.*vm@csrk-kmp,&csy^ampp*fi&vitpegih*fc@hirrmw&vshqer.") == "n. ri yong-gil, you will be replaced by dennis rodman." 
p north_korean_cipher("ribx^wxst:$wsyxl%osvie") == "next stop: south korea"
p north_korean_cipher("ger^wsqifshc*nywx^kix^qi&10000*fekw@sj$gssp%vergl@hsvmxsw?") == "can somebody just get me 100 bags of cool ranch doritos?" 

# Reflection

# C.J and Parjam reflecting separately