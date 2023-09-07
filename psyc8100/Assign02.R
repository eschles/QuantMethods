# Create an object called myseq that counts by 10s from 10-1000
(myseq <- seq(10,1000, by=10))

# Select the 6th, 7th, and 8th elements in the sequence
myseq[c(6,7,8)]

# Replace the 10th and 23rd elements in the sequence with 4 and 2, respectively.
(myseq[c(10,23)] <- c(4,2))

# In the Console, type set.seed(231).
set.seed(231)

# From a normal distribution with a mean of 100 and a standard deviation of 15,
# generate 400 random numbers and assign them to an object called x.
# Use the round() function to ensure that the data are rounded to a whole number (i.e., an integer).
(x <- round(rnorm(400, mean = 100, sd = 15)))

# What is the minimum of x?
min(x)

# What is the maximum of x?
max(x)

# Calculate the sample mean of x.
mean(x)

# Calculate the sample standard deviation of x.
sd(x)

# Construct a histogram of x and change the color of the histogram to any color except the default "gray." 
# Ensure that the label for the x-axis is WAIS.
hist(x, xlab = "WAIS", col="lightblue")
  