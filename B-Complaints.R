



install.packages("lpSolveAPI")
library(lpSolveAPI)

#want to solve for 6 variables, these correspond to the number of buckets
lprec <- make.lp(0, 6)

lp.control(lprec, sense="max")


#MODEL 1, NO CONSTRAINTS ON BUCKETS OR AVERAGE RESPONSE TIME
#the mean for each bin
set.objfn(lprec, c(13.8, 70.52,122.31,174.73,223.49,260.65))

#ADD CONSTRAINT ON AVERAGE RESPONSE TIME
#41 days
#add.constraint(lprec, c(13.8, 70.52, 122.31, 174.73, 223.49, 260.65), "=", 204600)

#40 days
add.constraint(lprec, c(13.8, 70.52, 122.31, 174.73, 223.49, 260.65), "=", 200000)

#45 days
#add.constraint(lprec, c(13.8, 70.52, 122.31, 174.73, 223.49, 260.65), "=", 225000)

#80 days
#add.constraint(lprec, c(13.8, 70.52, 122.31, 174.73, 223.49, 260.65), "=", 400000)


#add constaint on all variables not exceeding 5000 inspectors
add.constraint(lprec, c(1,1,1,1,1,1), "=", 5000)

#add constraing of minimum inspectors on first bin

add.constraint(lprec, c(1,0,0,0,0,0), ">=", 800)

add.constraint(lprec, c(0,1,0,0,0,0), ">=", 600)

add.constraint(lprec, c(0,0,1,0,0,0), ">=", 380)

#add.constraint(lprec, c(0,0,0,1,0,0), ">=", 300)

#add.constraint(lprec, c(0,0,0,0,1,0), ">=", 214)

#constraint of 30 percent last bin
add.constraint(lprec, c(0,0,0,0,0,1), ">=", 241)

lprec

solve(lprec)

get.objective(lprec)

get.variables(lprec)









