## Put comments here that give an overall description of what your
## functions do

#setwd('~/GitHub/ProgrammingAssignment2')
rm(list=ls())

## This Function Creates a special cached Matrix, which is really a list containing a function to
#   1) set the value of the matrix
#   2) get the value of the matrix
#   3) set the value of the inverse
#   4) get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
  
  i <- NULL
  
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  
  list( set=set, get=get,
        setinverse=setinverse,
        getinverse=getinverse )
  
}


# The following function calculates the inverse of the special "matrix"
# created with the above function. However, it first checks to see if
# the inverse has already been calculated. If so, it gets the inverse from
# the cache and skips the computation. Otherwise, it calculates the
# inverse of the data and sets the value of the inverse in the cache via
# the setinverse function.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  i <- x$getinverse()
  if(!is.null(i)) {
    return(i)
  }
  data <- x$get()
  i <- solve(b)
  x$setinverse(i)
  return(i)
}


## Create a test matrix
# dim = 300
# b <- matrix( rnorm(dim^2), nrow=dim, ncol=dim )
# cm <- makeCacheMatrix(b)

## Test that cacheSolve is accurate
# c <- cacheSolve(cm)
# d <- solve(b)
# print(all(c == d))

## Test Performance of caching function on large matrix
# require(microbenchmark)
# times <- microbenchmark( cacheSolve(cm), solve(b), times=1e2 )
# print(times)

