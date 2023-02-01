### -------------------- Lab 3 --------------------
### This lab is designed to prepare you for PS3

## Create a vector of the number of points the Seahawks scored in the
## first (at least) 5 games
## Hint: google "Seahawks scores", or check the football database:
## http://www.footballdb.com/teams/nfl/seattle-seahawks/results
## here 'Final' displays scores
## Use an appropriate variable name for the scores
## 
## Hint: feel free to invent if you cannot figure this out
seascores <- c(25, 11, 26, 17, 7)


## Create a vector of the number of points the opponent
## scored against Seahawks in the first 5 games
## use an appropriate variable name
opposcores <- c(32, 27, 27, 16, 27)

## Combine your two vectors into a dataframe
seagame <- data.frame(seascores, opposcores)


## Create a new column "diff" that is the difference in points
## (in favor of Hawks)
seagame$diff <- seascores - opposcores
seagame

## or seagame[["diff"]] <- seascores - opposcores


## Create a new column "won" which is TRUE if the Seahawks won,
## ie if Seahawks scored more than the opponent scored against them
seagame$W <- seagame$diff > 0
seagame

## Create a vector of the opponents name (such as "Denver Broncos")
opponent <- c("Pittsburgh Steelers", "Chicago Bears", "Dallas Cowboys", 
              "Denver Broncos", "San Francisco 49ers")

## Add the vector of opponents into the data frame
seagame$opponent <- opponent
seagame

## Compute the average score of Seahawks
mean(seagame$seascores)


## Compute how many games did Seahawks won
## (use the 'won' variable to compute it)
sum(seagame$W)


## What was the largest difference in scores (in favor of Seahawks)?
max(abs(seagame$diff))    ## abs() absolute value

## How many different opponents did Seahawks have in these games?
## Hint: use `unique()` and `length()`
?unique
length(unique(seagame$opponent))

## Print the variable names in your data frame
seagame <- seagame[ ,-5]    ## falsely put an extra column, deleted
names(seagame)

## Write a loop over all variables in your data frame
## print the variable name inside the loop
for (each in names(seagame)){
  cat(each, "\n")
}

## Write a loop over all variables in your data frame
## print the variable name inside the loop,
## and true/false, depending if the variable is numeric
## check out 'is.numeric()'
for(each in names(seagame)){
  cat(each, "\n")
      if(is.numeric(seagame[[each]])){
    cat(is.numeric(seagame[[each]]), "the variable is numeric:", seagame[[each]], "\n")
  }
}

## result show in characters
for(each in names(seagame)){
  cat(each, "\n")
  if(is.numeric(seagame[[each]])){
    cat(is.numeric(seagame[[each]]), "the variable is numeric:", seagame$each, "\n")
  }
}

## Write a loop over all variables in your data frame
## print the variable name inside the loop,
## and the average value of the variable
## if the variable is numeric
for(each in names(seagame)) {
  cat(each, "\n")
  if (is.numeric(seagame[[each]])) {
    cat(mean(seagame[[each]]), "\n")
  }
}


##
## HR data
## You are working in HR for a large firm with 100 employees.
## You are analyzing their salaries.

## Create a vector of 100 employees ("Employee 1", "Employee 2", ... "Employee
## 100")
## Hint: use 'paste()` or `str_c`
employees <- paste("Employee", 1:100)
employees

## Create a random vector of their 2021 salaries.
## Hint: you may use the runif function to create uniform random numbers,

## e.g. 'runif(100, 60, 120)' creates 100 random numbers between 60 and 120
salary_2021 <- runif(100, 60, 120)
salary_2021

## Create a random vector of 2022 salaries that are typically
## higher than the 2021 salaires (use runif again).
## For instance, if you create random numbers between 65 and 130, then 2022
## salaries tend to be larger than 2021 salaries.
salary_2022 <- runif(100, 70, 130)
salary_2022

## Create a data.frame 'salaries' by combining the vectors you just made
HR <- data.frame(employees, salary_2021, salary_2022)


## Create a column 'raise' that stores the size of the
## raise between 2021 and 2022
HR$raise <- salary_2022 - salary_2021


## Retrieve values from your data frame to answer the following questions:
##
## What was the 2022 salary of employee 57
HR[57, 3]


## Now round the answer down to two digits after comma
## check out 'round()' function
round(HR[57, 3])


## How many employees got a raise?
sum(HR$raise > 0)

## What was the value of the highest raise?
## Round the number to two digits!
highest_raise <- max(HR$raise)
highest_raise
## What was the name of the employee who recieved the highest raise?

HR$employee[HR$raise == highest_raise]

## What was the average salary increase?
## Round the number!
mean(HR$raise)

## For people who did not get a raise, how much money did they lose?
## Round the number!
round(mean(HR$raise[HR$raise < 0]), 2)    ## 2 means last two digits of decimal numbers
