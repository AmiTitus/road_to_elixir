# Elixir tips
- most of the language is immutable, every function is returning a new element. We are not changing the data.

# Types
```elixir
"Hello World" # String
name OR :name# Atom / Symbol
2 # Integer
0x1F # Integer
2.0 # Float
true # boolean
```
```Lists``` and ```Maps``` are ```Enumerable```

# Variable assignment
```elixir
name = "Philippe"
x = 2
```

# String format with variable
```elixir
"Hello, #{name}"
```

# Enums
To enumerate we call ```Enum.each()```. 

The first argument is the object we want to iterate.

The second argument is the function we want to run for each item.
```elixir
cities = ["vienna", "melbourne", "osaka", "calgary", "sydney"]
Enum.each(cities, &IO.puts/1) 
# Returns
# vienna
# melbourne
# osaka
# calgary
# sydney
# :ok
```

To map a function on a list, we call ```Enum.map()```
```elixir
Enum.map(cities, &String.capitalize/1) # With a captured
# Returns ["Vienna", "Melbourne", "Osaka", "Calgary","Sydney"]
```
```elixir
numbers = [4, 8, 15, 16, 23, 42]
Enum.map(numbers, fn (number) -> number * 2 end)
# Returns [8, 16, 30, 32, 46, 84]
```

Reduce ```Enum.reduce()```
```elixir
scores = [74, 79, 89, 32, 79, 70, 32, 69, 76, 73, 88, 73, 82, 31]
Enum.reduce(scores, fn (score, sum) -> sum + score end) # Performe the sum of the list scores
```

Sum of a list ```Enum.sum()```
```elixir
Enum.sum(scores)
```

# Lists
```elixir
shopping_list = ["fish", "ham", "eggs", "bread"]
shopping_lists = [["fish", "ham"], ["eggs", "bread"]]
```

## List basic functions
- Get the first element of a list
```elixir
List.first([1, 2, 3]) # Returns 1
```
- Get the last element of a list 
```elixir
List.last([1, 2 ,3]) # Returns 3
```
Reverse a list. List.reverse doesn't exist because list is an enum, we need so to use Enum.reverse() instead.
```elixir
Enum.reverse([1, 2, 3]) # Returns [3, 2 ,1]
```
# Maps
Key on the left, value on the right
Key can be an int, an atom...
```elixir
%{"name" => "Roberto", "age" => 56, "gender" => "Male"}
```
Content of map
```elixir
choices = %{
  1 => 4,
  2 => 1,
  3 => 2,
  4 => 2,
  5 => 1,
}
choices[1] # Returns 4
```

## Alternative Mapping
```elixir
person = %{
  name: "Izzy",
  age: "30ish",
  gender: "Female"
}
person = %{
  :name => "Izzy",
  :age => "30ish",
  :gender => "Female"
}

person[:name] # Returns "Izzy"
person.name # Same as above
```
# List of maps
```elixir
those_who_are_assembled = [
%{"name" => "Izzy", "age" => "30ish", "gender" => "Female"},
%{"name" => "The Author", "age" => "30ish", "gender" => "Male"},
%{"name" => "The Reader", "age" => "Unknowable", "gender" => "Unknowable"},
]
```
# Functions
In Elixir, a function differ by its name AND its number of parameters

Keyword is fn
```elixir
greeting = fn (place) -> "Hello, #{place}!" end
c_to_f = fn (c) -> c * 1.8 + 32 end
```
Use a function
```elixir
greeting.("Elixir") # Returns "Hello, Elixir!"
c_to_f.(20) # Will return 68.0

# You can also all function using this
greeting "Elixir" # Returns "Hello, Elixir!"
c_to_f 20 # Will return 68.0
```
## Multiple Arguments
```elixir
greeting = fn (name, gender, age) ->
    "Hello, #{name}! I see you're #{gender} and you're #{age} years old."
end
greeting.("Izzy", "Female", "30ish") # Returns "Hello, Izzy! I see you're Female and you're 30ish years old!"
```
## Capture Operator (Function Alternative)
&1 for first argument, &2 for second one etc
```elixir
captured_greeting = &("Hello #{&1}!")
```
Use
```elixir
captured_greeting.("World") # Returns "Hello World!"
```
Multiple Arguments
```elixir
captured_greeting = &("Hello, #{&1}! I see you're #{&2} and you're #{&3} years old.")
captured_greeting.("Izzy", "Female", "30ish") # Returns "Hello, Izzy! I see you're Female and you're 30ish years old!"
```
Other examples of captured functions
```elixir
cap = &String.capitalize/1
cap.("melbourne") # Returns "Melbourne"
```
## Arity

Arity of a function is indicated by ```\1``` for example at the end of a function.
It indicates the number of arguments that the function is taking in.

# File extension
```.exs``` for Elixir scripts

```.ex``` for Elixir file

# Pattern Matching
## Operator
Use ```=``` for matching. e.g.
```
"dog" = "dog" # Return "dog"
4 = 2 + 2 # Will return 4 because it's true
5 = 2 + 2 # Will return an error because it's false
```
Use ```_``` to match anything
## With lists
```elixir
those_who_are_assembled = [
%{age: "30ish", gender: "Female", name: "Izzy"},
%{age: "30ish", gender: "Male", name: "The Author"},
%{age: "56", gender: "Male", name: "Roberto"},
%{age: "38", gender: "Female", name: "Juliet"},
%{age: "21", gender: "Female", name: "Mary"},
%{age: "67", gender: "Female", name: "Bobalina"},
%{age: "54", gender: "Male", name: "Charlie"},
%{age: "10", gender: "Male", name: "Charlie (no relation)"},
]
[first, second, third | others] = those_who_are_assembled
# first is  %{age: "30ish", gender: "Female", name: "Izzy"}
# second is  %{age: "30ish", gender: "Male", name: "The Author"}
# third is  %{age: "56", gender: "Male", name: "Roberto"}
# others is  [%{age: "38", gender: "Female", name: "Juliet"}, ...]
```
## With maps
```elixir
person = %{name: "Izzy", age: "30ish"}
%{name: name, age: age} = person # will assign elements in person to the new map with the according key
```
## With lists and maps

The first_person variable, which contains all the information we have on Izzy in map form.

The first_name variable, which has stored the string "Izzy"

The others variable, which stored the remaining people in the list.
```elixir
those_who_are_assembled = [
%{age: "30ish", gender: "Female", name: "Izzy"},
%{gender: "Male", name: "The Author", age: "30ish"},
%{name: "The Reader", gender: "Unknowable", age: "Unknowable"},
]
[first_person = %{name: first_name} | others] = those_who_are_assembled
# first_person > %{age: "30ish", gender: "Female", name: "Izzy"}
# first_name > "Izzy"
```
```elixir
road = fn
  "high" -> "You take the high road!"
  "low" -> "I'll take the low road! (and I'll get there before you)"
  _ -> "Take the 'high' road or the 'low' road, thanks!" # Default to match anything
end
```
## Pattern matching inside functions
```elixir
road = fn
  "high" -> "You take the high road!"
  "low" -> "I'll take the low road! (and I'll get there before you)"
end

road.("high") # returns "You take the high road!"
road.("low") # returns "I'll take the low road! (and I'll get there before you)"
```
## Matching maps inside functions
```elixir
greeting = fn
  %{name: name} -> "Hello, #{name}!"
  %{} -> "Hello, Anonymous Stranger!" # Default
end

greeting.(%{name: "Izzy"}) # Returns "Hello, Izzy!"
```

# Input and output

To ask an user input (via prompt)
```elixir
name = IO.gets "What is your name ?"
```
You can also use trim function to remove any special character such as ```\n```
```elixir
name = String.trim(name)
```
To output a string
```elixir
IO.puts "Hello, my name is #{String.trim(name)}"
```