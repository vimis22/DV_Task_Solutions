
#Basic Concepts
# 1. Create a variable x and assign the value 5
x <- 5

# 2. Create a variable y and assign the value 8
y <- 8

# 3. Compute the product of x and y
x * y

# 4.1 Calculate the mean of numbers 1 through 5
result <- (1 + 2 + 3 + 4 + 5) / 5

# 4.2 Display the result
result

#Vectors and Data Frames
# 5. Create a numeric vector containing five ages.
ages <- c(23, 35, 28, 42, 19)

# 6. Create a character vector containing five names.
names <- c("Anna", "Peter", "John", "Maria", "David")

# 7. Check whether each person's age is greater than or equal to 30
age_30_or_more <- ages >= 30

# 8.2 Merge the vectors into a data frame.
people <- data.frame(
  Name = names,
  Age = ages,
  AgeThirtyOrMore = age_30_or_more
)

# 8.2 Display the data frame
people

# Functions

# 9
result <- mean(1:5)
result

# 10
random_numbers_1 <- rnorm(15)
random_numbers_1

# 11
random_numbers_2 <- rnorm(
  8,
  mean = 5,
  sd = 2
)

random_numbers_2

# 12
plot(random_numbers_1)
plot(random_numbers_2)

