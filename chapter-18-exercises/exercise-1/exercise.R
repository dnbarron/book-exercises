# load relevant libraries
library("httr")
library("jsonlite")

# Be sure and check the README.md for complete instructions!


# Use `source()` to load your API key variable from the `apikey.R` file you made.
# Make sure you've set your working directory!
source('api_key.R')

# Create a variable `movie_name` that is the name of a movie of your choice.
movie_name <- "little women"


# Construct an HTTP request to search for reviews for the given movie.
# The base URI is `https://api.nytimes.com/svc/movies/v2/`
# The resource is `reviews/search.json`
# See the interactive console for parameter details:
#   https://developer.nytimes.com/movie_reviews_v2.json
#
# You should use YOUR api key (as the `api-key` parameter)
# and your `movie_name` variable as the search query!

base_url <- "https://api.nytimes.com/svc/movies/v2/"
resource <- "reviews/search.json"
query_title <- list(query = movie_name, "api-key" = nyt_apikey)


# Send the HTTP Request to download the data
# Extract the content and convert it from JSON
reviews <- GET(paste0(base_url, resource), query = query_title)
reviews
reviews_text <- content(reviews, "text")
reviews_data <- fromJSON(reviews_text) 


# What kind of data structure did this produce? A data frame? A list?


# Manually inspect the returned data and identify the content of interest 
# (which are the movie reviews).
# Use functions such as `names()`, `str()`, etc.


# Flatten the movie reviews content into a data structure called `reviews`

reviews_flat <- flatten(reviews_data[["results"]])
# From the most recent review, store the headline, short summary, and link to
# the full article, each in their own variables
headline1 <- reviews_flat[1, "headline"]
short_summary <- reviews_flat[1, "summary_short"]
link <- reviews_flat[1, "link.url"]


# Create a list of the three pieces of information from above. 
# Print out the list.
review_latest <- list(headline1, short_summary, link)

