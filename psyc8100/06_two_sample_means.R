##                 PSYC 8100: Module 6                ##
##            Test on Two Independent Means           ##

# Create data ####

# Create two variables. One variable is a vector of integers
# called wonderlic. The other variable is a factor called sex.
# Here, I code male as 1 and female as 2.

wonderlic <- c(22,14,24,17,19,20,25,28,20,26,29)

sex <- rep(c(1,2), c(6,5))
sex <- factor(sex, labels = c("male", "female"))

# Create data frame using our two variables. Then, remove
# wonderlic and sex from the Global Environment.

wonderlic.df <- data.frame(wonderlic,sex)
rm(wonderlic, sex)

# Ensure the dimensions of the data frame are correct.
# There should be 11 observations/rows and 2 variables.
# Examine a summary of the data frame. Check the first
# six rows for accuracy.

str(wonderlic.df)
summary(wonderlic.df)
head(wonderlic.df)

# Conduct test on two independent sample means ####

# Use the t.test() function to conduct the two sample
# t-test. The t.test() has a formula method for specifying
# the outcome and the categorical predictor.
# wonderlic is the outcome. sex is the categorical predictor.
# outcome ~ predictor
# Use the data argument to specify where R should look for the
# variables.
# By using var.equal = T, we obtain the conventional Student's t
# instead of Welch's t (which allows for heterogeneous variances).

t.test(wonderlic ~ sex, data = wonderlic.df, var.equal=TRUE)

# When working with a data frame, we can use the 
# aggregate() function to obtain summary statistics by 
# some grouping variable. In this case, obtain the 
# mean, standard deviation, and number of scores for 
# wonderlic grouped by sex.

# Notice that the first argument is the outcome that we want
# summarized. To the right of the tilde, we use a factor for 
# grouping. The third argument is what function you want for 
# R to use. I use mean. Then, I use sd. Then, I use length.
# mean is for calculating the mean of a numeric.
# sd is for calculating the standard deviation of a numeric.
# length simply counts how many elements there are.

aggregate(wonderlic ~ sex, wonderlic.df, mean)
aggregate(wonderlic ~ sex, wonderlic.df, sd)
aggregate(wonderlic ~ sex, wonderlic.df, length)

# To learn more about aggregate.

help(aggregate)

# Check homogeneity of variance assumption ####

# The two independent samples t-test requires three assumptions:
# normality, independence, and homogeneity of variance.
# For now, we will focus on the homogeneity of variance assumption.
# With this assumption, the population variance in each group
# should not differ from one another.
# We will use Levene's test in the car package to check this
# assumption. We do NOT want the test to be statistically
# significant. In other words, we are hoping that the p-value
# will be greater than .05.

library(car)
leveneTest(wonderlic ~ sex, wonderlic.df, center = mean)

# Notice that the p-value associated with this test was not
# less than .05. Thus, we can conclude that the two population
# variances do not differ from one another. We saw the 
# standard deviations in the output above (3.559 & 3.507). 
# Thus, it is not too surprising of a result.We can also 
# examine the boxplots on wonderlic by sex.

boxplot(wonderlic.df$wonderlic ~ wonderlic.df$sex,
        xlab = "Sex",
        ylab = "Wonderlic",
        col = "slategray3")

# The variability is not drastically different for males
# vs. females.

# Instead of t.test(), we can use another function.
# The output is formatted nicely and also produces an
# estimate of Cohen's d.

# If we load the lsr package, then we can use 
# independentSamplesTTest() function. This function works
# best when your data is in a data frame (not a tibble),
# and your independent variable should be a factor.

# If we assume that we have a tibble called wonderlic.df,
# we can "coerce" it to a data frame by typing:
# wonderlic.df <- as.data.frame(wonderlic.df)
# Ensure that your independent variable is a factor.
# If sex is not a factor, you can change it by typing:
# wonderlic.df$sex <- factor(wonderlic.df$sex)

# Because I am using a data frame and sex is already
# a factor, I only need to use the two lines below.

library(lsr)
independentSamplesTTest(wonderlic ~ sex, data=wonderlic.df, var.equal=T)

# For an example summary of the two sample t-test, see 
# the sample APA style summaries in Canvas. See the bottom 
# of the Modules page and also Module 1.
