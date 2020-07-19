# Make a program that generates a very short story. 
# Get it to take some input of a person, a place and an object -- using IO.gets/1 and combine all three into a little sentence, output with IO.puts/1.
person = String.trim(IO.gets("Whodunit? "))
place = String.trim(IO.gets("Where? "))
object = String.trim(IO.gets?("With what? "))
IO.puts "I suggest it was [#{person}] in the [#{place}] with the [#{object}]"
# Ponder on what happens when you remove the IO.puts from the beginning of Line 3 in greet.exs and then run the program with elixir greet.exs. 
# Think about how this would be different if you put that code into an iex prompt.
"Hello, #{String.trim(name)}! You're #{String.trim(age)}? That's so old!"
# We need to use IO.puts if we want to output an element from a elixir script (.exs)