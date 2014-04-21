# U2.W6: Drawer Debugger


# I worked on this challenge with Parjam Davoody and C.J. Jameson


# 2. Original Code

class Drawer

attr_reader :contents

# Are there any more methods needed in this class?

def initialize
    @contents = []
    @open = true
end

def open
    @open = true
end

def close
    @open = false
end 

def add_item(item)
    @contents << item
end

def remove_item(item = @contents.pop) #what is `#pop` doing? By default is removing the last itemem in the drawer
    @contents.delete(item)
end

def dump  # what should this method return? It doesn't need to return anything in particular, but it does need to empty the contents. 
    puts "Your drawer is empty."
    @contents = [] 
end

def view_contents
    if @contents.length == 0
        puts "The drawer is empty"
    else
        puts "The drawer contains:"
        @contents.each {|silverware| puts "- " + silverware.type }
    end
end

end

class Silverware
    
attr_reader :type

# Are there any more methods needed in this class?

def initialize(type, clean = true)
    @type = type
    @clean = clean
end

def eat
    puts "eating with the #{type}"
    @clean = false
end

def clean_silverware
    puts "clean the #{type}"
    @clean = true
end

end

knife1 = Silverware.new("knife")

silverware_drawer = Drawer.new
silverware_drawer.add_item(knife1) 
silverware_drawer.add_item(Silverware.new("spoon"))
silverware_drawer.add_item(Silverware.new("fork")) 
silverware_drawer.view_contents

silverware_drawer.remove_item
silverware_drawer.view_contents
sharp_knife = Silverware.new("sharp_knife")


silverware_drawer.add_item(sharp_knife)

silverware_drawer.view_contents

removed_knife = silverware_drawer.remove_item(sharp_knife)
removed_knife.eat
removed_knife.clean_silverware 

silverware_drawer.view_contents
silverware_drawer.dump
silverware_drawer.view_contents #What should this return? This should have some special logic to say that the drawer is empty


fork = silverware_drawer.remove_item(fork) #add some puts statements to help you trace through the code...
puts fork
fork.eat

#BONUS SECTION
# puts fork.clean

# DRIVER TESTS GO BELOW THIS LINE






# 5. Reflection 
