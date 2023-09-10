# 1. Install and Load the "Car" Package
install.packages("car", dependencies = TRUE)
library(car)

# Always a good idea to examine your data. Ensure that you know
# what variables and data types are in your data frame. Are any
# variables supposed to be converted to factors? Are there 
# variables that should be character? How many rows and columns  
# are in your data frame?
str(Duncan) # First, examine the data that you're working with
summary(Duncan) 
names(Duncan) # Check the names of the variables in Duncan

# 2a. What is the correlation between prestige and income?
cor(Duncan$income, Duncan$prestige) # Answer: 0.8378014

# 2b.What is the correlation between prestige and education?
cor(Duncan$prestige, Duncan$education) # Answer: 0.8519156

# 2c. What is the correlation between income and education?
cor(Duncan$income, Duncan$education) # Answer: 0.7245124

# 3a. Predict prestige using income.
ppr <- lm(prestige ~ income, data = Duncan) # find the fitted model
summary(ppr) # fitted model
predict(ppr, new=list(income=20)) # Predict prestige if income is 20

# 3b. What percent of variance can be explained by your model?
summary(ppr)$r.squared # find the coefficient of determination: 0.7019111
0.7019111*100 # find percentage of the coefficient of determination
# Answer: ~70.19%
  # Helpful Info: The coefficient of determination represents the proportion of variance in the outcome 
  # that can be attributed to the predictor. (excerpt from .rmd)

# 3c. What is the estimated regression equation? 
# First, find the slope and intercept:
ppr$coefficients # intercept: 2.456574 slope: 1.080390
# Answer: \hat{y}_i = 2.46 + 1.08 x_{i}

# 3d. Interpret the regression slope.
ppr$coefficients # intercept: 2.456574 slope: 1.080390
# Answer: 1.08 -> positive slope

# 3e. What is the predicted prestige when income = 70 vs. 90?
predict(ppr, new=list(income=c(70, 90)))
# 70: 78.08
# 90: 99.69

# 3f. Which prediction would be inappropriate and why?
range(Duncan$income) # Define the range of the predictor (income) -> min: 7, max: 81
# Answer: 90
# 90 is outside of the observed range for this predictor, considering the max is 81.
