## This file provides utility to cache a matrix inverse
## MakeCacheMatrix is used as a getter setter for the matrix and matrix inversions
## cacheSolve identifies if a matrix inverse is already available and caculates if not present

## This function returns a list of setter and getter methods of a matrix and its inverse

makeCacheMatrix <- function(x = matrix()) {
   i <- NULL
   set <- function(y) {
   x <<- y ## setting the value of the variable in the global environment
   i <<- NULL ## setting the value of the variable in the global environment
   }
   get <- function() x
   
   setInverse <- function(inverse) i <<- inverse
   getInverse <- function() i
   list(set = set, get = get, setInverse = setInverse , getInverse = getInverse) # reutrning a list of functions
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        i <- x$getInverse()
        if(!is.null(i)) {
                message("getting cached data")
                return(i)
        }
        data <- x$get()
        m <- solve(data)
        x$setInverse(i)
        i
}
