#   Sampling Distribution of the Mean 

# Examine characteristics of the sampling dist'n of the mean
# when mu = 10, sigma = 6.
# Consider when n = 20 vs. n = 200.
# Notice that as n increases, the sampling variability of the means decreases.
# That is, as n increases, the standard error of the mean decreases.

set.seed(125)    # For reproducible results
n <- c(20, 200)  # two different sample sizes
mu <- 10         # population mean
sigma <- 6       # population standard deviation
iter <- 100000   # number of iterations

# Empty matrix to store results
sample.means <- matrix(NA, nrow = iter, ncol = 2)
colnames(sample.means) <- paste0("n.eq.",n)

for (j in 1:length(n)){
  for (i in 1:iter){
    sample.means[i,j] <- mean(rnorm(n[j], mean = mu, sd = sigma))
  }
}

# Change some graphical parameters. Here, print layout will have one row
# and two columns, filled row-wise.
par(mfrow=c(1,2))

# Generate histogram of the sampling dist’n of means when n = 20

hist(sample.means[,1], ylim = c(0,20000),  xlim = c(0,20),
     xlab = "Sample Means",
     main = "Dist'n of Sample Means, n = 20")
text(18, 18500, expression(~mu~"= 10"), cex = 1.1)
text(18, 17500, expression(~sigma~"= 6"), cex = 1.1)

# Generate histogram of the sampling dist’n of means when n = 200

hist(sample.means[,2], ylim = c(0,20000),  xlim = c(0,20),
     xlab = "Sample Means",
     main = "Dist'n of Sample Means, n = 200")
text(18, 18500, expression(~mu~"= 10"), cex = 1.1)
text(18, 17500, expression(~sigma~"= 6"), cex = 1.1)

colMeans(sample.means)     # Compute mean of the sampling dist’n of means. 
apply(sample.means,2,sd)   # Compute SD of the sampling dist’n of means.
