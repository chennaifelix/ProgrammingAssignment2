## This file provides utility to cache a matrix inverse
## MakeCacheMatrix is used as a getter setter for the matrix and matrix inversions
## cacheSolve identifies if a matrix inverse is already available and caculates if not present

## This function returns a list of setter and getter methods of a matrix and its inverse

makeCacheMatrix <- function(x = matrix()){
        x_i <- NULL  ### Setting the inverse matrix to NULL
        
        set <- function(y){
                x <<- y ### Setting the variable x with the matrix and storing it in the parent environment
                x_i <<- NULL ### Setting the inverse matrix to NULL and storing it in the parent environment
        }
        get <- function(){
                x ### returining the stored matrix
        }
        
        setInverse <- function(m_inverse){
                x_i <<- m_inverse # storing the inverse got from computation to x_i
        }
        
        getInverse <- function(){
                x_i
        }
        
        list <- list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}

### This function checks if inverse is present already to get from cache. Calculate otherwise
cacheSolve <- function(a){
        if(!is.null(a$getInverse())){
                message("Getting from cache")
                return(a$getInverse())  
        }
        else{
                message("Solving to get the inverse")
                inverse <- solve(a$get())
                a$setInverse(inverse)
                return(inverse)
        }
}

