## Put comments here that give an overall description of what your
## functions do

##caching the matrix inverse
##matrix inverse is costly and it may be beneficial to cache the inverse of a matrix instead of computing it repeatedly
##Functions below will create objects that store the matrix and cache its inverse

##this function creates a list that contains a function used to create a special kind of matrix that can cache its inverse


makeCacheMatrix <- function(x = matrix()){
 n <- NULL
 set<<- function (z){
   x <<- z
   n <<- NULL
 }
 get<-function()x
 setinverse <- function(inverse)n <<- inverse
 getinverse <- function()n
 list(set=set, get=get,
       setinverse=setinverse, getinverse=getinverse)
 }


## Write a short comment describing this function

##The function below computes the inverse of the matrix created by the above function
##if the inverse is already calculated, the inverse is returned from the cache

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  n <- x$getinverse()
  if(!is.null(n)){
    message("getting cached data")
    return(n)
  }
  mat <- x$get()
  n <- solve(mat,...)
  x$setinverse(n)
  n
}
