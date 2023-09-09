# Install and Load the "Car" Package
install.packages("car", dependencies = TRUE)
library(car)

str(Duncan) # First, examine the data that you're working with
summary(Duncan)

# What is the correlation between prestige and income?
cor(Duncan$income, Duncan$prestige) # 0.8378014

# What is the correlation between prestige and education?
cor(Duncan$prestige, Duncan$education) # 0.8519156

# What is the correlation between income and education?
cor(Duncan$income, Duncan$education) # 0.7245124

# Predict prestige using income.
ppr <- lm(Duncan$prestige ~ Duncan$income, data = Duncan) # find the fitted model
summary(ppr) # fitted model



# What percent of variance can be explained by your model? 

# What is the estimated regression equation? 

# Interpret the regression slope.

# What is the predicted prestige when income = 70 vs. 90? 

# Which prediction would be inappropriate and why?

