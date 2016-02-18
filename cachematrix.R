
## Put comments here that give an overall description of what your
## functions do

## Sample Run
## source("C:/Users/Eric/Documents/RStudio/ProgrammingAssignment2/ProgrammingAssignment2/cachematrix.R")
## m <- makeCacheMatrix(x)
##> m$get()
##col1 col2 col3
##[1,]   -1    3   -3
##[2,]    0   -6    5
##[3,]   -5   -3    1
##> m$getinverse()
##NULL
##> cacheSolve(m)
##[,1]      [,2]       [,3]
##col1  1.500000  1.000000 -0.5000000
##col2 -4.166667 -2.666667  0.8333333
##col3 -5.000000 -3.000000  1.0000000
##> m$getinverse()
##[,1]      [,2]       [,3]
##col1  1.500000  1.000000 -0.5000000
##col2 -4.166667 -2.666667  0.8333333
##col3 -5.000000 -3.000000  1.0000000
##> cacheSolve(m)
##getting cached data
##[,1]      [,2]       [,3]
##col1  1.500000  1.000000 -0.5000000
##col2 -4.166667 -2.666667  0.8333333
##col3 -5.000000 -3.000000  1.0000000
##> cache <- cacheSolve(m)
##getting cached data
##> cache
##[,1]      [,2]       [,3]
##col1  1.500000  1.000000 -0.5000000
##col2 -4.166667 -2.666667  0.8333333
##col3 -5.000000 -3.000000  1.0000000
##> 


## creates the object out of the matrix with functions
makeCacheMatrix <- function(x = matrix()) {
  ## Desired Result Variable
  inversesolution <- NULL
  
  set <- function(y){
    x <<-y
    inversesolution <<-NULL
  }
  
  get <- function() { 
    x 
  }
  
  setinverse <- function(new_inversesolution){
    inversesolution <<-  new_inversesolution
  }
  
  getinverse <- function(){ 
    inversesolution 
  }
    
  
  list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
  
}


## Write a short comment describing this function
## Solves the inverse matrix or retrieves the cached value if available
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
  newlysolved <- NULL
  alreadysolved <- NULL
  
  alreadysolved <- x$getinverse()
  
  if(!is.null(alreadysolved)){
    message("getting cached data")
    return(alreadysolved)
  }
  data <- x$get()
  newlysolved <-solve(data)
  x$setinverse(newlysolved)
  newlysolved
  
  
}
