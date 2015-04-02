####################################
#       set working directory
####################################
setwd("C:/Users/JIN/Desktop/INDE321")   # set working directory in windows
#setwd("~/Desktop/INDE321")             # set working directory in mac or linux
getwd()                                 # show current working directory

help(getwd) # check help doc
?getwd      # check help doc

####################################
#       R data structures
####################################
# vector
v1 <- c(1,2,5.3,6,-2,4)                  # numeric vector
v2 <- c("one","two","three")             # character vector
v3 <- c(TRUE,TRUE,TRUE,FALSE,TRUE,FALSE) # logical vector

# matrix
m1 <- matrix(1:20, nrow=5,ncol=4)

# arrays
a1 <- array(1:20, dim = c(2,2,5))

# data frames
d1 <- data.frame(v1, v2)

# lists
l1 <- list(v1, m1, d1)

# check data type
class(m1)
class(a1)
class(d1)
class(l1)

####################################
#       import data files
####################################
?mtcars
data(mtcars)

# or import from external files
# for csv
mydata <- read.csv(file = "./mtcars.csv", header = TRUE)

# for excel
library(gdata)                          # load gdata package to use read.xls
?read.xls
mydata <- read.xls("mydata.xls")

# for minitab
library(foreign)                        # load foreign package to use read.mtp
?read.mtp
mydata <- read.mtp("mydata.mtp")

####################################
#       Viewing data
####################################
data(mtcars)                              # load mtcars
mydata <- mtcars                          # assign mtcars to variable mydata
mydata                                    # print data
head(mydata, n = 10)                      # print first 10 rows of data
tail(mydata, n = 5)                       # print last 5 rows of data
dim(mydata)                               # dimsions of an object
class(mydata)                             # data type of an object
names(mydata)                             # list the variables' names in an object
str(mydata)                               # structure of an object
ncol(mydata)                              # number of columns
nrow(mydata)                              # number of rows

# view the data at row 2, col 5
mydata[2,5]                               # through index
mydata[2,"hp"]                            # through name

# view the data at col 5
mydata[,5]
mydata$hp

# view the data at first 3 rows
mydata[1:3,]
mydata[c(1,2,3),]


####################################
#       R packages
####################################
install.packages("ggplot2")             # install ggplot2 package
library(ggplot2)                        # load package
require(ggplot2)                        # another way to load package

?ggplot

ggplot(data = mtcars, aes(x = as.factor(gear), y = mpg, fill = as.factor(gear))) + 
  geom_boxplot() + 
  xlab("") + ylab("Miles per Gallon") +
  ggtitle("Miles by Gear Number")

####################################
#       class exercise
####################################
install.packages("qcc")                 # Install R package ‘qcc’
library(qcc)                            # Load ‘qcc’
?pistonrings                            # Check the help document of built-in dataset, ‘pistonrings’
data(pistonrings)                       # load data
class(pistonrings)                      # Show the data type of pistonrings
dim(pistonrings)                        # Show the dimension of pistonrings
names(pistonrings)                      # Show the variable names of pistonrings
pistonrings[1:8,]                       # Show the first 8 rows of pistonrings
pistonrings[5,2]                        # What is the value of row 5, col 2 in pistonrings
# see in class                          # Challenge: what is the mean value of diameter in pistonrings

####################################
#       statistics
####################################
mydata <- pistonrings
mean(mydata$diameter)
var(mydata$diameter)
sd(mydata$diameter)                     # check square root of var = sd?
sqrt(var(mydata$diameter)) == sd(mydata$diameter)
min(mydata$diameter)
max(mydata$diameter)
median(mydata$diameter)
quantile(mydata$diameter, 1/2)          # is this equal to median?
quantile(mydata$diameter, 3/4)
quantile(mydata$diameter, 1/4)
IQR(mydata$diameter)                    # quantile(x, 3/4) - quantile(x, 1/4)?

summary(mydata$diameter)

table(mtcars$cyl)
table(mtcars[,c("cyl", "hp")])

####################################
#      ggplot2, plotting       
####################################
library(ggplot2)
mydata <- mtcars

# scatter plot
ggplot(data = mydata, aes(x = wt, y = mpg, color = as.factor(cyl))) +
  geom_point(size = 8) +
  xlab("Weight (lb/1000)") + ylab("Miles/(US) gallon") +
  ggtitle("scatter plot example with ggplot2")

# boxplot
ggplot(data = mydata, aes(x = as.factor(cyl), y = mpg, fill = as.factor(cyl))) + 
  geom_boxplot() + 
  geom_jitter() +
  xlab("Number of cylinders") + ylab("Miles/(US) gallon") +
  ggtitle("boxplot plot example with ggplot2")

# histogram
ggplot(data = mydata, aes(mpg, fill = as.factor(cyl))) +
  geom_histogram(aes(y = ..density..), color = "black", alpha = 0.2) + 
  geom_density(color = "blue", alpha = 0.5) +
  ggtitle("histogram plot example with ggplot2")

####################################
#      class exercise
####################################
library(qcc)
data(pistonrings)
mydata <- pistonrings
ggplot(data = mydata, aes(diameter)) +
  geom_histogram(aes(y = ..density.., fill = as.factor(trial)), color = "black") +
  geom_density() +
  ggtitle("distribution for exercise")
