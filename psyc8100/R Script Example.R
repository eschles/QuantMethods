#  Brief Example using R Script ####

scores <- c(12, 8, 12, 12, 16, 13, 18, 17, 18)

# We used the combine function c() to create a vector.
# We created a vector of numerics, a vector of characters, and 
# a vector of logicals.

weight <- c(75, 66, 87, 65, 72, 57, 92, 84, 77)
height <- c(1.72, 1.75, 1.8, 1.69, 1.92, 1.65, 1.95, 1.89, 1.83)
spatial <- c(35, 42, 22, 40, 19, 27, 32, 36, 44)
math.ach <- c(21, 27, 19, 29, 21, 25, 26, 23, 30)

## Vectorized calculations ####

bmi <- weight/height^2

## Calculate sample mean  ####

mean(bmi)   # Using the mean() function

x.bar <- sum(bmi)/length(bmi)

## Calculate sample variance & sample standard deviation ####

var(bmi)
sd(bmi)

# sample size of bmi
n.obs <- length(bmi)

# deviation scores of bmi
dev.scores <- bmi - x.bar

# squared deviation scores of bmi
sq.dev.scores <- dev.scores^2

# sample variance
sum(sq.dev.scores)/(n.obs-1)


(var1 <- sum((bmi - x.bar)^2)/(length(bmi)-1))

## Generate Scatterplot ####

plot(height, weight)
plot(height, weight, col="red", pch = 2)

## Covariance ####

cov(height, weight)

## Pearson's correlation coefficient ####

cor(height, weight)

## Data frame ####

# Typically, you will import data into R as a data frame.
# Here, instead, we will take the existing variables and
# create a data frame using the data.frame() function.

fake.data1 <- data.frame(weight, height, bmi, spatial, math.ach)
fake.data1

# Remove the individual objects that we created.
# Notice how the Global Environment has changed.

rm(weight,height,bmi,spatial,math.ach)

dim(fake.data1)    # Check the number of rows/columns in data frame 
str(fake.data1)    # str() function provides more info about our data frame

summary(fake.data1)

# With the code below, R will return an error. Remember that these two variables
# no longer exist in the Global Environment.

plot(height, weight, col="red", pch = 2)


# We need to tell R where the variables are. Notice how the following approaches work.

with(fake.data1, plot(height, weight, col="purple", pch = 8))

plot(fake.data1$height, fake.data1$weight, col="blue", pch = 10)

# Add a new variable to a data frame

fake.data1$surname <- c("Kim","Jones","Rosopa","Cox","Smith","Riley","Li","Sherman","Gomez")

summary(fake.data1)

## Packages ####

# We can install packages from the R Console...
# Need the name of the package.
# Set dependencies argument to TRUE.

install.packages("car", dependencies = TRUE)

# Can also install using Packages tab.
# When you want to use a package, be sure to load the package.

library(car)
