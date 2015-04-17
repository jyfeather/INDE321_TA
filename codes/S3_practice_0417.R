#################
# Random walk on the 2D plane: for each point (x, y), x =
#   x + rnorm(1) and y = y + rnorm(1)
#################
library(animation)
library(GGally)
library(ggplot2)
ani.options(interval = 0.05, nmax = 30)
par(mar = c(3, 3, 2, 0.5), mgp = c(2, 0.5, 0), tcl = -0.3, 
    cex.axis = 0.8, cex.lab = 0.8, cex.main = 1)
brownian.motion(pch = 21, cex = 5, col = "red", bg = "yellow", 
                main = "Demonstration of Brownian Motion")

#################
#  challenge 1
#################
x <- seq(3, 6, by = 0.1)
exp(x)*cos(x)

sum_easy <- function(x, y) {
  result <- x + y
  return(result)
}

sum_easy(1, 2)
sum_easy(2, 3)

func_1 <- function(x) {
  return(exp(x)*cos(x))
}
func_1(x)

#################
#  challenge 2 
#################
x <- mtcars$cyl
mode(x)

x1 <- table(x)
x2 <- sort(x1, decreasing = TRUE)
mode <- names(x2)[1]
mode <- as.numeric(mode)

what_is_mode <- function(x) {
  x1 <- table(x)
  x2 <- sort(x1, decreasing = TRUE)
  mode <- names(x2)[1]
  mode <- as.numeric(mode)
  return(mode)
}

what_is_mode(x)

#################
#  exercise 
#################
x <- c(1,2,3,4,1)
which(x == 1)

mydata <- mtcars
x1 <- mtcars$cyl
x2 <- mtcars$am
x3 <- which(x1 == what_is_mode(x1))
what_is_mode(x2[x3])

#################
#  challenge 3
#################
library(ggplot2)
x1 <- mydata$mpg
x2 <- mydata$hp
cor(x1, x2)
ggplot(data = mydata, aes(x = mpg, y = hp)) + geom_point()

cor(mydata)

library(GGally)
ggpairs(mydata[,1:5])

#################
#  challenge 4 
#################
ggplot(data = mydata, aes(x = mpg)) + 
  geom_histogram(binwidth = 5) +
  scale_x_continuous(breaks = 1:40)


#################
#  exercise 
#################
x <- c(16.05, 16.03, 16.02, 16.04, 16.05, 16.01, 16.02, 16.02, 16.03, 16.01, 16.00, 16.07)
tell_me_sample_average <- function(x) {
  result <- sum(x) / length(x)
  return(result)
}
tell_me_sample_average(x)

tell_me_sample_standard_deviation <- function(x) {
  x1 <- sum(x^2)
  x2 <- sum(x)^2 / length(x)
  result <- sqrt((x1-x2)/(length(x)-1))
  return(result)
}
tell_me_sample_standard_deviation(x)
