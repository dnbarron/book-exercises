# Exercise 4: functions and conditionals

# Define a function `is_twice_as_long` that takes in two character strings, and 
# returns whether or not (e.g., a boolean) the length of one argument is greater
# than or equal to twice the length of the other.
# Hint: compare the length difference to the length of the smaller string

is_twice_as_long <- function(s1, s2){
  length_1 <- nchar(s1)
  length_2 <- nchar(s2)
  smallest_length <- min(length_1, length_2)
  diff_length <- abs(length_1 - length_2)
  diff_length >= (smallest_length) 
}

# Call your `is_twice_as_long` function by passing it different length strings
# to confirm that it works. Make sure to check when _either_ argument is twice
# as long, as well as when neither are!

is_twice_as_long("aa", "aaaa")
is_twice_as_long("aa", "aaaaaa")
is_twice_as_long("aaaaaa", "aa")
is_twice_as_long("aaaaaa", "aaaa")

# Define a function `describe_difference` that takes in two strings. The
# function should return one of the following sentences as appropriate
#   "Your first string is longer by N characters"
#   "Your second string is longer by N characters"
#   "Your strings are the same length!"

describe_difference <- function(s1, s2){
  
  diff_length <- nchar(s1) - nchar(s2)
  
  if (diff_length < 0) {
    return(paste("Your second string is longer by", abs(diff_length), "characters"))
  }  
  if (diff_length > 0) {
      return(paste("Your first string is longer by", abs(diff_length), "characters"))  
  }
  print("Your strings are the same length")
  
}


# Call your `describe_difference` function by passing it different length strings
# to confirm that it works. Make sure to check all 3 conditions1

describe_difference("aa", "aaaa")
describe_difference("aa", "aaaaaa")
describe_difference("aaaaaa", "aa")
describe_difference("aaaaaa", "aaaa")
describe_difference("aaaa", "aaaa")
