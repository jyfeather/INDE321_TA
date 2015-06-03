##################################
# QCC examples
##################################
library(qcc)
## x bar & R chart
data(pistonrings)
x <- qcc.groups(pistonrings$diameter, pistonrings$sample)
qcc(x, type = "xbar")

# problem from slides
x <- c(34.5, 34.2, 31.6, 31.5, 35, 34.1, 32.6, 33.8, 34.8, 33.6, 31.9, 38.6, 35.4, 
        34, 37.1, 34.9, 33.5, 31.7, 34, 35.1, 33.7, 32.8, 33.5, 34.2)
R <- c(3, 4, 4, 4, 5, 6, 4, 3, 7, 8, 3, 9, 8, 6, 5, 7, 4, 3, 8, 4, 2, 1, 3, 2)
n <- 5
m <- 24

# for x bar chart
R_bar <- mean(R)
d2 <- 2.326 # for n = 5
x.sd <- R_bar/d2

# visualize
obj_x <- qcc(x, sizes = n, std.dev = x.sd, type = "xbar")
# summary
summary(obj_x)

# for R chart
D3 <- 0
D4 <- 2.114
LCL <- D3 * R_bar
UCL <- D4 * R_bar

obj_R <- qcc(R, sizes = n, type = "R", limits = c(LCL, UCL))

# delete all
rm(list = ls())

## p chart
x <- matrix(NA, nrow = 22, ncol = 3)
edit(x)
x[,1] <- rep(1:22)
x[,2] <- c(19, 7, 11, 29, 24, 24, 15, 25, 11, 10, 37, 18, 17, 21, 16, 16, 23, 14, 4, 21, 24, 10)
x[,3] <- rep(200, 22)

obj_p <- qcc(data = x[,2], sizes = 200, type = "p")

# mannually
p_bar <- mean(x[,2])/200
UCL <- p_bar + 3 * sqrt(p_bar*(1-p_bar)/200)
LCL <- p_bar - 3 * sqrt(p_bar*(1-p_bar)/200)
obj_p <- qcc(data = x[,2], sizes = 200, limits = c(LCL, UCL), type = "p")

# monitor new samples
obj_p <- qcc(data = x[1:15, 2], sizes = 200, type = "p", newdata = x[16:22, 2], newsizes = 200)

rm(list=ls())

## u chart
x <- c(12, 14, 20, 18, 15, 12, 11, 15, 12, 10, 18, 14, 9, 10, 14, 13, 16, 18, 20, 17)
y <- c(18, 18, 24, 22, 22, 22, 20, 20, 20, 20, 18, 18, 18, 20, 20, 20, 24, 24, 22, 21)

obj_c <- qcc(data = x, sizes = y, type = "u")
obj_c <- qcc(data = x[1:15], sizes = y[1:15], type = "u", newdata = x[16:20], newsizes = y[16:20])

## CUSUM & EWMA
x <- c(9.45, 7.99, 9.29, 11.66, 12.16, 10.18, 8.04, 11.46, 9.2, 10.34, 9.03, 11.47, 
       10.51, 9.4, 10.08, 9.37, 10.62, 10.31, 8.52, 10.84, 10.90, 9.33, 12.29, 11.50, 
       10.6, 11.08, 10.38, 11.62, 11.31, 10.52)
obj_xbar <- qcc(data = x, type = "xbar.one")
obj_cusum <- cusum(data = x, center = 10, decision.interval = 5, se.shift = 0.5)
obj_ewma <- ewma(data = x, center = 10, std.dev = 1, lambda = 0.1)

rm(list=ls())

## Question 9.13
x <- c(9,8,6,3,2,5,8,1,1,8,2,3,5,7,8,8,4,11,2,7,10,3,3,4,1,2,2,3,1,2,3,5,2,4,1,6,3,7,5,7)
obj <- cusum(data = x, center = 4.5, std.dev = 2.79, decision.interval = 8.01, se.shift = 0.25)
