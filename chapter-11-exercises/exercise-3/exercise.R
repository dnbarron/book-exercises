# Exercise 3: using the pipe operator

# Install (if needed) and load the "dplyr" library
#install.packages("dplyr")
library("dplyr")

# Install (if needed) and load the "fueleconomy" package
#install.packages('devtools')
#devtools::install_github("hadley/fueleconomy")
library("fueleconomy")
data("vehicles")

# Which 2015 Acura model has the best hwy MGH? (Use dplyr, but without method
# chaining or pipes--use temporary variables!)
v_2015 <- filter(vehicles, year == 2015)
v_2015_accura <- filter(v_2015, make == "Acura")
v_best <- filter(v_2015_accura, hwy == max(hwy))
select(v_best, model)

# Which 2015 Acura model has the best hwy MPG? (Use dplyr, nesting functions)
select(filter(filter(filter(vehicles, year == 2015), make == "Acura"),
              hwy == max(hwy)), model)

# Which 2015 Acura model has the best hwy MPG? (Use dplyr and the pipe operator)
vehicles %>% filter(year == 2015) %>% filter(make == "Acura") %>%
  filter(hwy == max(hwy)) %>% select(model)


### Bonus

# Write 3 functions, one for each approach.  Then,
# Test how long it takes to perform each one 1000 times
base_func <- function(year_choice, make_choice){
  temp1 <- filter(vehicles, year == year_choice)
  temp2 <- filter(temp1, make == make_choice)
  temp3 <- filter(temp2, hwy == max(hwy))
  select(temp3, model)
}
base_func(2015, "Acura")

nest_func <- function(year_choice, make_choice){
  select(filter(filter(filter(vehicles, year == year_choice), 
                       make == make_choice),
                hwy == max(hwy)), model)
}
nest_func(2015, "Acura")

pipe_func <- function(year_choice, make_choice){
  vehicles %>% filter(year == year_choice) %>% 
    filter(make == make_choice) %>%
    filter(hwy == max(hwy)) %>% select(model)
}
pipe_func(2015, "Acura")

system.time(for (i in 1:1000) base_func(2015, "Acura"))
system.time(for (i in 1:1000) nest_func(2015, "Acura"))
system.time(for (i in 1:1000) pipe_func(2015, "Acura"))
