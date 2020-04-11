## Put comments here that give an overall description of what your
## functions do

##caching the matrix inverse
##matrix inverse is costly and it may be beneficial to cache the inverse of a matrix instead of computing it repeatedly
##Functions below will create objects that store the matrix and cache its inverse

##this function creates a list that contains a function used to create a special kind of matrix that can cache its inverse


makeCacheMatrix <- function(x = matrix()){
  
  ##setting the cache value to NULL
 n <- NULL
 
 ##
 
 set<<- function (z){
   x <<- z
   
   ##assigning environment n NULL
   n <<- NULL
 }
 
 #getting x from environment
 get<-function()x
 
 setinverse <- function(inverse)n <<- inverse
 
 ##getting the solve function
 getinverse <- function()n
 
 ## generating cache list for special matrix
 list(set=set, get=get,
       setinverse=setinverse, getinverse=getinverse)
 }


## Write a short comment describing this function

##The function below computes the inverse of the matrix created by the above function
##if the inverse is already calculated, the inverse is returned from the cache

cacheSolve <- function(x, ...) {
  
  ## Return a
  n <- x$getinverse()
  
  ##checking if the cache value is present
  if(!is.null(n)){
    
    ##setting message for when cache data is found
    message("getting cached data")
    
    ##setting to return cached value
    return(n)
  }
  
  ##if cache data not found, retrieving original data
  mat <- x$get()
  
  ##solving for the inverse matrix
  n <- solve(mat,...)
  
  ##cache the solved inverse matrix
  x$setinverse(n)
  
  ##return the solved data
  n
}


