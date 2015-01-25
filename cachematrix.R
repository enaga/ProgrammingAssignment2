##  - makeCacheMatrix function creates a vector that can cache inverse of the matrix supplied
## - cacheSolve function computes the inverse of the vector returned by makeCacheMatrix. If the inverse has already been calculated then cacheSolve will retrieve inverse from cache, other will compute the inverse.
## - If the supplied matrix for makeCacheMatrix changes then it will go through set function and the inverse will be reset to null, which will inturn force cacheSolve to recompute the inverse.

## For a given matrix makeCacheMatrix outputs a list of set and get functions for matrix and set and get functions for inverse of the matrix supplied

makeCacheMatrix <- function(mx = matrix()) {
  ix <- NULL
  set <- function(y) {
    mx <<- y
    ix <<- NULL
  }
  get <- function() mx
  setinverse <- function(iy) ix <<- iy
  getinverse <- function() ix
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## For a vector of type makeCacheMatrix retrieves the inverse if not found then will compute the inverse which will get set into cache

cacheSolve <- function(mcx, ...) {
  ix <- mcx$getinverse()
  if(!is.null(ix)) {
    message("getting cached data")
    return(ix)
  }
  data <- mcx$get()
  ix <- solve(data, ...)
  mcx$setinverse(ix)
  ix
}

## ######  Usage Instructions - START ###### 

## ## Scenario # 1: For a matrix outputs inverse and retrieves from cache 
## 
## > mymx <- matrix(c(4,2,7,6), 2,2)
## > mycmx <- makeCacheMatrix(mymx)
## > cacheSolve(mycmx)
##      [,1] [,2]
## [1,]  0.6 -0.7
## [2,] -0.2  0.4
## > cacheSolve(mycmx)
## getting cached data
##      [,1] [,2]
## [1,]  0.6 -0.7
## [2,] -0.2  0.4
## 
## ## Scenario # 2: Change values of matrix - recomputes and outputs inverse and retrieves from cache
## ## (forces cacheSolve to recompute the inverse by assigning null to the inverse variable ix)
## 
## > mymx <- matrix(c(1,2,3,4), 2,2)
## > mycmx <- makeCacheMatrix(mymx)
## > cacheSolve(mycmx)
##      [,1] [,2]
## [1,]   -2  1.5
## [2,]    1 -0.5
## > cacheSolve(mycmx)
## getting cached data
##      [,1] [,2]
## [1,]   -2  1.5
## [2,]    1 -0.5
## 
## ## Scenario # 3: Another way to change values of matrix - recomputes and outputs inverse and retrieves from cache
## ## (forces cacheSolve to recompute the inverse by assigning null to the inverse variable ix)
## 
## > mycmx$set(mymx)
## > cacheSolve(mycmx)
##      [,1] [,2]
## [1,]   -4  3.5
## [2,]    3 -2.5
## > cacheSolve(mycmx)
## getting cached data
##      [,1] [,2]
## [1,]   -4  3.5
## [2,]    3 -2.5
## > 
##
## ######  Usage Instructions - END ###### 
