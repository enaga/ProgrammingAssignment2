
## ######  Usage Instructions - START ###### 

## Scenario # 1: For a matrix outputs inverse and retrieves from cache 

> mymx <- matrix(c(4,2,7,6), 2,2)
> mycmx <- makeCacheMatrix(mymx)
> cacheSolve(mycmx)
     [,1] [,2]
[1,]  0.6 -0.7
[2,] -0.2  0.4
> cacheSolve(mycmx)
getting cached data
     [,1] [,2]
[1,]  0.6 -0.7
[2,] -0.2  0.4

## Scenario # 2: Change values of matrix - recomputes and outputs inverse and retrieves from cache
## (forces cacheSolve to recompute the inverse by assigning null to the inverse variable ix)

> mymx <- matrix(c(1,2,3,4), 2,2)
> mycmx <- makeCacheMatrix(mymx)
> cacheSolve(mycmx)
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
> cacheSolve(mycmx)
getting cached data
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5

## Scenario # 3: Another way to change values of matrix - recomputes and outputs inverse and retrieves from cache
## (forces cacheSolve to recompute the inverse by assigning null to the inverse variable ix)

> mycmx$set(mymx)
> cacheSolve(mycmx)
     [,1] [,2]
[1,]   -4  3.5
[2,]    3 -2.5
> cacheSolve(mycmx)
getting cached data
     [,1] [,2]
[1,]   -4  3.5
[2,]    3 -2.5
> 

## ######  Usage Instructions - END ###### 
