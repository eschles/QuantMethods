###    PSYC 8100: Module 04                     ####
###    Correlation & Simple Linear Regression   ####

#### Create Data ####

# Data taken from Chapter 7 of Dr. Rosopa's statistics textbook.
# We create two numeric vectors---stress and eat_difficulties.

stress <- c(17, 8, 8, 20, 14, 7, 21, 22, 19, 30)
stress

eat_difficulties <- c(9, 13, 7, 18, 11, 2, 5, 15, 26, 28)
eat_difficulties

# Create a data frame with stress and eat_difficulties.
# LETTERS is a built-in function in R with uppercase letters.
# I select the first 10 uppercase letters A through J.

stress_eat <- data.frame(student=LETTERS[1:10], stress, eat_difficulties)
stress_eat

# Remove the two variables stress and eat_difficulties from the
# Global Environment.

rm(stress, eat_difficulties)

# Notice that these two variables do not exist anymore.
stress
eat_difficulties

#### Explore the Data ####

# Always a good idea to examine your data. Ensure that you know
# what variables and data types are in your data frame. Are any
# variables supposed to be converted to factors? Are there 
# variables that should be character? How many rows and columns  
# are in your data frame?

str(stress_eat)
summary(stress_eat)

# We have a 10 x 3 data frame (10 rows, 3 columns).

# head() prints first six rows. Although we have a small 
# data frame, useful when we have very large data frames and  
# we do not want to fill the entire Console. If you want to
# see more rows, change the optional argument.

head(stress_eat)
head(stress_eat, 8)

# tail() prints last six rows. Although we have a small 
# data frame, useful when we have very large data frames and  
# we do not want to fill the entire Console. If you want to
# see more rows, change the optional argument.

tail(stress_eat)

# For histogram of eat_difficulties, use hist()
# hist(stress_eat$eat_difficulties)
# hist(stress_eat[,3], xlab = "Eating Difficulties")

# For boxplot of stress, use boxplot()
# boxplot(stress_eat$stress)
# boxplot(stress_eat[,2], ylab = "Stress", main = "Boxplot for Sample of College Students", col = "light blue")

#### Pearson's Correlation ####

# There are many functions for computing the 
# correlations among numeric variables. We will use a simple  
# function in base R. We have to use indexing because not all 
# of the variables in stress_eat are numeric. Notice that the 
# first column is just letters. We cannot correlate the letters
# with anything. We want only column 2 and column 3.

cor(stress_eat[, 2:3])
cor(stress_eat[, -1])
cor(stress_eat[, c("stress","eat_difficulties")])

# Alternatively, if we know the names of the variables in the
# data frame, we can index the variables in our data frame
# by name.

# Confirm the names of your variables in your data frame. Then,
# correlate the numeric/quantitative variables we are interested in.

names(stress_eat)

cor(stress_eat[ , c("stress","eat_difficulties")])

#### Simple Linear Regression ####

# Look how easy it is to write code to compute a correlation
# matrix among two variables. Only one line of R code! Because
# we have not covered hypothesis testing, we do not yet have
# a statistical test on the correlation to determine whether
# it is "statistically significant." We will cover this soon.

# Regress eating difficulties on stress. We use the lm() function. The
# The dependent variable (outcome) appears to the left of the tilde. It
# is the variable we are trying to predict. In this case, we are trying
# to predict eat_difficulties. The independent variable (predictor) 
# appears to the right of the tilde. In this case, we are using stress. The
# data argument is where we specify for R where to go find the variables. Both
# eat_difficulties & stress are variables that are in the data frame called 
# stress_eat. Thus, the data argument is data=stress_eat. Although there are 
# other ways to fit a model without using the data argument, it is a good idea
# to get into the habit of using the data argument.

# A note about the fitted model. In my example below, I assigned the fitted 
# model to a variable called slr. You can call your model whatever you like.
# Instead of slr, you can use myregression or reg.hw1. The results of your 
# analysis will be stored inside of this object, whatever you decide to call it.

slr <- lm(eat_difficulties ~ stress, data=stress_eat)
summary(slr)

# summary() is a generic function. Depending on the object, the
# summary() function will provide a summary that is appropriate
# for the specific type of object. Recall that when we used
# summary on line 40 above, it provided min, max, mean, etc. on each
# variable. The object was a data frame. However, on line 116,
# the object slr is not a data frame. slr is an lm object and R
# knows to provide a summary specific to an lm object.

# Let's confirm what type of object slr is.

class(slr)

# We see that the estimated Y-intercept is .4005 and the estimated
# regression slope for stress is .7831. Thus, for a 1-unit
# increase on stress, eating difficulties is expected to increase
# by .7831 units. A 2-unit increase on stress is associated
# with a 2*.7832 = 1.5662 increase on eating difficulties.
# A 3-unit increase on stress is associated with a 3*.7832 = 2.3496.

# At the bottom of the output, we see that the coefficient of
# determination is 0.6752^2 = .4559. Thus, stress accounts
# for about 46% of the variance in perceived eating difficulties.
# So please do not let this course stress you out.

# There likely are a number of other variables that are predictive 
# of eating difficulties. We hope to find other "useful" predictors
# of eating difficulties, thus, increasing the percentage of explained
# variance. Equivalently, as we add "useful" predictors, errors in 
# prediction tend to decrease. As you saw in the Agresti chapter,
# these errors are quantified as sum-of-squared errors or residual 
# sum-of-squares.

# Examine a scatterplot of the data with Stress on the x axis
# and Eating Difficulties on the y axis.

# Remember that our fitted regression model was called slr.
# We can overlay the fitted regression line on our scatterplot by
# using the abline function with the name of the fitted model as
# the only argument. However, I change the default line type and color.

plot(stress_eat[, 2:3], xlab="Stress", ylab="Eating Difficulties")
abline(slr, lty=5, lw=2, col="purple")

# If you want to change the line type (lty), line width (lw), or color (col),
# experiment with other input arguments like lty=4 and col="orange".
# Rerun BOTH lines of code above because we need to redraw the scatterplot
# and regression line.

#### Making Predictions ####

# What if you wanted to make predictions using this regression equation?
# We use the function predict(). The first argument is the fitted
# lm object. In my case, my model was called slr. We then use the optional
# 'new' argument and pass a list of the values on the predictor.

# What is predicted eating difficulties, if stress = 20?

predict(slr, new=list(stress=20))

# R used the regression model that we fit called slr.
# Remember that the intercept was .4005 and the slope for stress was .7831.
# R simply used these estimates, and the stress score of 20.
# Predicted Eating Difficulties = .4005 + .7831*20 = 16.06255.

# What is predicted eating difficulties, if stress = 11, 24, or 28?

predict(slr, new=list(stress=c(11, 24, 28)))

# This is the same as manually calculating the predicted eating difficulties.

.4005 + .7831*11
.4005 + .7831*24
.4005 + .7831*28

# NOTE: We should only make predictions on the outcome WITHIN the 
# observed range of the predictor variables. Because our predictor
# "stress" has a minimum of 7 and a maximum of 30, we should not 
# predict eating difficulties for a person with a stress score of, say,
# 4 or 38. In other words, do NOT extrapolate. See 9.6 in Agresti.

# This was an introduction to correlation and simple linear
# regression. For SPSS, use Chapter 7 of my textbook that walks 
# through entering in the data and clicking Analyze --> Correlate
# to obtain the correlation.

# Simple linear regression has only one predictor. When we add
# predictors to our model, this is often referred to as multiple
# linear regression.

# See 1.5.2 in Fox & Weisberg for a brief preview of multiple linear
# regression using the Duncan data. Two predictors (education and income)
# are used to predict prestige. As we add predictors, we include them to the
# right of the tilde and separate all of our predictors by +. Below, we
# are using education AND income to predict prestige. We will cover 
# multiple linear regression later in the course.

library(car)
duncan.model <- lm(prestige ~ education + income, data=Duncan)
summary(duncan.model)
