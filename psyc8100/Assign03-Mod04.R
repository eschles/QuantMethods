# Install and Load the "Car" Package
install.packages("car", dependencies = TRUE)
library(car)

# What is the correlation between prestige and income?
str(Duncan)
summary(Duncan)

class(Duncan$prestige)
class(Duncan$income)

cor(Duncan$income, Duncan$prestige)

# What is the correlation between prestige and education?
cor(Duncan$education, Duncan$prestige)

# What is the correlation between income and education?
cor(Duncan$education, Duncan$income)


