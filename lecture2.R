#Lecture 2


#1

# Create a vector containing names
names_vector <- c("Peter", "Lise", "Hans", "Lars", "Jens")

# Display vector
names_vector

# 1a. Remove "Lise" from the vector
names_without_lise <- names_vector[-2]

names_without_lise

# 1b. Remove multiple names using a range of indexes
names_removed_range <- names_vector[-(2:4)]

names_removed_range

# Remove multiple names using a vector of indexes
names_removed_indexes <- names_vector[-c(1, 3, 5)]

names_removed_indexes


# 2

# Create a numeric vector of length 5
x <- c(1, 2, 3, 4, 5)

x

# 2a. Multiply every element by 5
x_times_5 <- x * 5

x_times_5

# 2b. Create another vector of length 5
y <- c(2, 4, 6, 8, 10)

# Multiply corresponding elements
x_times_y <- x * y

x_times_y

# Example with vectors of different lengths
x2 <- c(1, 2, 3, 4, 5)
y2 <- c(10, 20)

x2 * y2

# R uses vector recycling when vectors have different lengths.
# A warning may occur if the longer vector length is not
# a multiple of the shorter vector length.


# 3

# Create a family list with four elements
family <- list(
  mother = "Anna",
  father = "Peter",
  children = c("Emma", "Oliver"),
  children_age = c(12, 8)
)

family

# 3a. Get names of elements in the list
names(family)

# Get length of the list
length(family)

# 3b. Select an element and change its value
family$father <- "Lars"

family

# It could also be changed using its index
family[[2]] <- "Peter"

family

# 3c. Extend the list with pets and pets' ages
family$pets <- c("Bella", "Max")

family$pets_age <- c(4, 2)

family


# 4

# This part should normally be saved in a file called:
# firstscript.R

# Generate 100 random normal numbers
random_numbers <- rnorm(100)

# Plot the random numbers
plot(
  random_numbers,
  main = "100 Random Normal Numbers",
  xlab = "Observation",
  ylab = "Value"
)

# If firstscript.R is saved in your working directory,
# it can be run using:
# source("firstscript.R")


# 5

# Assign values to A and B
A <- 31
B <- 60

# 5a. Construct vector P containing numbers between A and B
P <- A:B

P

# Check the length
length(P)

# 5b. Create matrix Q with 6 rows and 5 columns
Q <- matrix(
  P,
  nrow = 6,
  ncol = 5
)

Q

# 5c. Examine the objects

class(A)
class(B)
class(P)
class(Q)

length(A)
length(B)
length(P)
length(Q)

dim(Q)

str(A)
str(B)
str(P)
str(Q)


# 6

# Create three random normal vectors of length 100
x1 <- rnorm(100)
x2 <- rnorm(100)
x3 <- rnorm(100)

# 6a. Create data frame T
T <- data.frame(
  a = x1,
  b = x1 + x2,
  c = x1 + x2 + x3
)

# Display first rows
head(T)

# 6b. Plot the data frame
plot(T)

# Calculate standard deviation for each column
apply(T, 2, sd)

# 6c.
# Run the script multiple times to observe
# how the random values change.

# 6d. Plot using graphical parameters
plot(
  T$a,
  type = "l",
  ylim = range(T),
  lwd = 3,
  col = rgb(1, 0, 0, 0.3)
)

lines(
  T$b,
  type = "s",
  lwd = 2,
  col = rgb(0.3, 0.4, 0.3, 0.9)
)

points(
  T$c,
  pch = 20,
  cex = 4,
  col = rgb(0, 0, 1, 0.3)
)

# Help commands
# help("rgb")
# help("par")
# ?rgb
# ?points


# 7-10 Data Preparation

# Install tidyverse only the first time:
# install.packages("tidyverse")

# Load dplyr
library(dplyr)

# Load Star Wars data
data(starwars)


# 7. SELECT

# 7a. Select only name, height and gender
select_7a <- starwars %>%
  select(name, height, gender)

select_7a


# 7b. Select name and all variables between mass
# and species inclusive
select_7b <- starwars %>%
  select(name, mass:species)

select_7b


# 7c. Select all variables except birth_year and gender
select_7c <- starwars %>%
  select(-birth_year, -gender)

select_7c


# 8

# 8a. Only include males
filter_8a <- starwars %>%
  filter(sex == "male")

filter_8a


# 8b. Only include females from Alderaan
filter_8b <- starwars %>%
  filter(
    sex == "female",
    homeworld == "Alderaan"
  )

filter_8b


# 8c. Only include individuals from
# Alderaan, Coruscant or Endor
filter_8c <- starwars %>%
  filter(
    homeworld %in% c(
      "Alderaan",
      "Coruscant",
      "Endor"
    )
  )

filter_8c


# 9

# 9a. Convert height from centimeters to inches
# and mass from kilograms to pounds
mutate_9a <- starwars %>%
  mutate(
    height_inches = height / 2.54,
    mass_pounds = mass * 2.20462
  )

mutate_9a


# 9b. Change eye colors that are not
# black, blue or brown to "other"
mutate_9b <- starwars %>%
  mutate(
    eye_color = ifelse(
      eye_color %in% c(
        "black",
        "blue",
        "brown"
      ),
      eye_color,
      "other"
    )
  )

mutate_9b


# 9c. Create a height category:
# taller than 180 = "tall"
# otherwise = "short"
mutate_9c <- starwars %>%
  mutate(
    heightcat = ifelse(
      height > 180,
      "tall",
      "short"
    )
  )

mutate_9c


# 9d. Set heights greater than 200
# or less than 75 to missing (NA)
mutate_9d <- starwars %>%
  mutate(
    height = ifelse(
      height > 200 | height < 75,
      NA,
      height
    )
  )

mutate_9d


# 10 Calculation

# 10a. Calculate mean height and mass
calculate_10a <- starwars %>%
  summarise(
    mean_height = mean(
      height,
      na.rm = TRUE
    ),
    mean_mass = mean(
      mass,
      na.rm = TRUE
    )
  )

calculate_10a


# 10b. Calculate mean height and mass by gender
calculate_10b <- starwars %>%
  group_by(gender) %>%
  summarise(
    mean_height = mean(
      height,
      na.rm = TRUE
    ),
    mean_mass = mean(
      mass,
      na.rm = TRUE
    )
  )

calculate_10b


# 10c. Calculate mean height for females
# grouped by species using the pipe operator
calculate_10c <- starwars %>%
  filter(sex == "female") %>%
  group_by(species) %>%
  summarise(
    mean_height = mean(
      height,
      na.rm = TRUE
    )
  )

calculate_10c

