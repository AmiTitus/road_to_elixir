# Make a function that takes either a map containing a "name" and "age", or just a map containing "name".
# Change the output depending on if "age" is present.
# What happens if you switch the order of the function clauses? What can you learn from this?
about = fn
  %{"name" => name, "age" => age} ->
    "#{name} is #{age} years old"
  %{"name" => name} ->
    "I don't know how old #{name} is!"
end
# Nothing will happen