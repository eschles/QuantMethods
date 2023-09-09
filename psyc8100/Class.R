# Assign a Variable, add with another variable
x <- 1
y <- 3
x + y

# Create an object; "c" - combine
(my.data <- c(3, 7, 28))

# Create a sequence of numbers
(your.data <- 4:10)

# Create a vector; "rep" - replicate
(vec1 <- rep(c(1,3,8), c(4,7,9)))

# Create a new object and calculate its normal distribution
(my.data2 <- rnorm(50, mean = 25))

# Find the mean of that same object
mean(my.data2)

# Find the type of object
typeof(my.data)

# Grab a specific value in a vector
scores <- c(12, 8, 12, 12, 16, 13, 18, 17, 18)
(scores[c(2)] <- 9)

# Use a logical to replace multiple numbers at once
(scores[scores == 12] <- 15)

# Grab specific elements and replace with specific numbers
(my.data[c(1, 3, 5)] <- c(45000, -29, 0))


