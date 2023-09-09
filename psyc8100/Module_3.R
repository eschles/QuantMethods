# Create a matrix
(myMatrix <- matrix(1:12, nrow=3, ncol=4))

# Create a second matrix that "recycles" elements to meet the required length
(myMatrix2 <- matrix(c("a", "b", "c"), 4, 3, byrow=TRUE))

# Find the dimension of myMatrix
(dim(myMatrix))

# Create a vector with a random permutation of the first 10 numbers
set.seed(54321)
(v <- sample(10, 10))

# What is the length of V?
length(v)

# Turn "v" into a one column matrix
as.matrix(v)

# Turn "v" into a one row matrix
matrix(v, nrow=1)

# Create a three-dimensional array (row, column, layer)
(array.3 <- array(1:24, dim = c(4,3,2)))

# Create a three-item list
(list.1 <- list(mat.1=myMatrix, mat.2=myMatrix2, vec=v))

# Index "v" by grabbing the 4th element twice
(v[c(4,2,4)])

# Grab the negative index of "v"
(v[-c(2,3,5)])

# index the elements of "v" by name
(names(v) <- letters[1:10])

# grab the letters of the word "fig"
(v[c("f","i","g")])

# Grab all elements of "v" that are less than 6
(v[v<6])

# Make a copy of "v"
(vv <- v)

# Replace elements 1, 3, 5 in "vv"
(vv[c(1,3,5)] <- 1:3)
vv

# Replace c, d, & e with "NA"
vv[c("c", "d", "e")] <- NA
vv

# Remove vv
remove(vv)

# Recall myMatrix
myMatrix

# Grab the element in r2, c3
myMatrix[2, 3]

# Grab the vector in rows 1&2, column 2
myMatrix[c(1,2), 2]

# Grab the submatrix in r1-2, c2-3
myMatrix[c(1,2), c(2,3)]

# Grab rows 1-2, all columns
myMatrix[1:2, ]

# Produce a vector
myMatrix[ ,2]

# Produce a single column matrix
myMatrix[,2, drop=FALSE]

# Omit columns 1 & 3
myMatrix[ , -c(1, 3)]

# Omit row 1 and col 2
myMatrix[-1, -2]

# Set row names
rownames(myMatrix)<- c("one", "two", "three")

# Set column names
colnames(myMatrix) <- c("w", "x", "y", "z")

# Check
myMatrix

# Select 1st and 3rd rows
myMatrix[c(TRUE, FALSE, TRUE), ]

# Make a copy of "myMatrix"
AA <- myMatrix

# Set the first row to zeros
AA[1, ] <- 0
AA
remove(AA)

# Index list 1, elements 2&3
list.1[c(2, 3)]

# Return a one-element list
list.1[2]

# Return a matrix
list.1[[2]]

# Produce a single element
list.1[["mat.1"]]

# Replace an element
list.1$mat.1 <- matrix(7:10, 2, 2)

# Create a new element
list.1$title <- "an arbitrary list"

# Delete an element
list.1$mat.2 <- NULL

# Check progress
list.1

# Set the list element to NULL
list.1["title"] <- list(NULL)
list.1

# Index the extracted list element
list.1$vec[3]

# Try to index a non-extracted item (it returns NULL)
list.1$foo


