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

# basic one
ggplot(data = mydata, aes(x = mpg, y = cyl)) + geom_point()

# how to map data to aesthetic
ggplot(data = mydata, aes(x = mpg, y = cyl, color = as.factor(am))) + geom_point()

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
