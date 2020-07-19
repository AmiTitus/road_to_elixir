# Make a function which turns fahrenheit temperatures into celsius.
c_to_f = fn (c) -> c * 1.8 + 32 end
f_to_c = fn (f) -> (f - 32) / 1.8 end
# Make a function which returns the number of seconds in the specified amount of days. For example, seconds.(2) should tell us how many seconds there are in 2 days.
seconds = fn (days) -> days * 24 * 60 * 60 end
# Make a function which takes two maps with "age" keys in them and returns the average age.
average_age = fn (person_a, person_b) -> person_a.age + person_b.age / 2 end
## Add pattern matching to got straight the age
average_age = fn (%{"age" => age_a}, %{"age" => age_b}) -> (age_a + age_b) / 2 end
_ = average_age.(%{"age" => 15}, %{"age" => 45}) # Will return 30.0
# Save any of these three solutions in their own file and run them through the elixir command-line tool.