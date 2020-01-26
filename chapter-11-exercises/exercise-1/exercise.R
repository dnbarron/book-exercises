# Exercise 1: working with data frames (review)

# Install devtools package: allows installations from GitHub
install.packages("devtools")

# Install "fueleconomy" dataset from GitHub
devtools::install_github("hadley/fueleconomy")

# Use the `libary()` function to load the "fueleconomy" package
library(fueleconomy)

# You should now have access to the `vehicles` data frame
# You can use `View()` to inspect it

data("vehicles")
View(vehicles)

# Select the different manufacturers (makes) of the cars in this data set. 
# Save this vector in a variable
makes <- vehicles$make

# Use the `unique()` function to determine how many different car manufacturers
# are represented by the data set
length(unique(makes))

# Filter the data set for vehicles manufactured in 1997
library(dplyr)
vehicles_1997 <- vehicles %>% filter(year == 1997)

# Arrange the 1997 cars by highway (`hwy`) gas milage
# Hint: use the `order()` function to get a vector of indices in order by value
# See also:
# https://www.r-bloggers.com/r-sorting-a-data-frame-by-the-contents-of-a-column/

vehicles_1997_ord <- vehicles_1997 %>% arrange(hwy)

# Mutate the 1997 cars data frame to add a column `average` that has the average
# gas milage (between city and highway mpg) for each car

vehicles_1997_ord_ave <- vehicles_1997_ord %>% mutate(average = (cty + hwy) / 2)

# Filter the whole vehicles data set for 2-Wheel Drive vehicles that get more
# than 20 miles/gallon in the city. 
# Save this new data frame in a variable.

vehicles_sub <- vehicles %>% filter(drive == "Front-Wheel Drive" | 
                                      drive == "Rear-Wheel Drive" ) %>%
  filter(cty > 20)

# Of the above vehicles, what is the vehicle ID of the vehicle with the worst 
# hwy mpg?
# Hint: filter for the worst vehicle, then select its ID.
vehicles_sub %>% filter(hwy == min(hwy)) %>% select(id)

# Write a function that takes a `year_choice` and a `make_choice` as parameters, 
# and returns the vehicle model that gets the most hwy miles/gallon of vehicles 
# of that make in that year.
# You'll need to filter more (and do some selecting)!

most_efficient <- function(year_choice, make_choice){
  vehicles_sub <- vehicles[vehicles$year == year_choice, c("make", "model", "hwy")]
  vehicles_sub <- vehicles_sub[vehicles_sub$make == make_choice, ]
  vehicles_sub[vehicles_sub$hwy == max(vehicles_sub$hwy), 'model']
}

# What was the most efficient Honda model of 1995?
most_efficient(1995, "Honda")
