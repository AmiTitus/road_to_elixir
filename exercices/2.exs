# If we store the number of seconds in a day using this code: seconds = 86400, calculate using that variable how many hours there are in 30 days.
seconds = 86400
_ = seconds / 60 / 60 * 30
## Shorter version
_ = seconds / 60 / 2

# Create a variable called name, store a string in it and place the value of that variable in another string.
name = "Philippe"
_ = "Hello #{name}"

# The line 5 / "four" shows an error. Think about why this error might happen.
5 / "four"
# It's not possible to divide an integer by a string