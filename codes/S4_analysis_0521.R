library(mice)                          # mice is a R package for missing data

######################
#     dataset: boys
######################
boys                                   # boys is missing dataset in package mice
names(boys)
head(boys)
str(boys)
######################
# age: Decimal age (0-21 years)
# hgt: Height (cm) 
# wgt: Weight (kg)
# bmi: Body mass index
# hc:  Head circumference (cm)
# gen: Genital Tanner stage (G1-G5)
# phb: Pubic hair (Tanner P1-P6)
# tv:  Testicular volume (ml)
# reg: Region (north, east, west, south, city)
######################

######################
#     identify missing data
######################
x1 <- NA
x2 <- 0/0
x3 <- 1/0
is.na(x1)
is.nan(x1)
is.infinite(x1)                                      # na & nan is missing, inf is not
is.na(x2)
is.nan(x2)
is.infinite(x2)
is.na(x3)
is.nan(x3)
is.infinite(x3)

mydata <- boys
is.na(mydata[1,"age"])                               # cannot use var == NA
is.na(mydata[1,"gen"])
is.na(mydata[,"gen"])                                # check na for a vector
is.na(mydata)                                        # check na for a data.frame

complete.cases(mydata)                               # which row is complete
mydata[complete.cases(mydata),]                      # list complete rows
mydata[!complete.cases(mydata),]                     # list incomplete rows

sum(complete.cases(mydata))                          # how many rows have missing data
sum(is.na(mydata$gen))                               # how many missing values in variable gen


######################
#   explore missing values patterns
######################
# by tabular 
md.pattern(mydata)

# by visualization
library(VIM)                                         # Package VIM provides many plotting options
aggr(mydata, prop = FALSE, numbers = TRUE)
matrixplot(mydata)
marginplot(mydata[,c("age", "gen")])

# by correlation
x <- as.data.frame(abs(is.na(mydata)))
head(x)
head(mydata)
y <- x[,-1]                                          # delete firs variable because it has no missing values
cor(y)

######################
#  dealing with incomplete data
######################
# Complete-case analysis
newdata <- mydata[complete.cases(mydata),]           # option 1
newdata <- na.omit(mydata)                           # option 2
head(newdata)

# simple imputation
x <- mydata$tv
x
x_median <- median(x, na.rm = TRUE)
x[is.na(x)] <- x_median
x

######################
#  hypothesis testing
######################
# one sample t test
x <- c(0.593, 0.142, 0.329, 0.691, 0.231, 0.793, 0.519, 0.392, 0.418)
t.test(x, alternative = "greater", mu = 0.3)
t.test(x, alternative = "two.sided", mu = 0.3)

# two samples t tests
x <- c(91, 87, 99, 77, 88, 91)     # treatment group
y <- c(101, 110, 103, 93, 99, 104) # control group
t.test(x, y, alternative = "less", var.equal = TRUE) # variance are equal
t.test(x, y, alternative = "less", var.equal = FALSE) # variance are inequal

# paired t test
x <- c(16, 20, 21, 22, 23, 22, 27, 25, 27, 28) # regular
y <- c(19, 22, 24, 24, 25, 25, 26, 26, 28, 32) # premium
t.test(x, y, alternative = "less", paired = TRUE)
