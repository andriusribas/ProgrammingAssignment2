## This function creates a special matrix, with getters and setters for it and its inverse

makeCacheMatrix <- function(x = matrix()) {
    ## inverse is initialized with NULL
    inverse <- NULL
    
    ## create "set" and "get" for the value of the original matrix
    set <- function(y) {
        x <<- y
        inverse <<- NULL
    }
    get <- function() x
    
    ## create set and get for the value of the inverted matrix
    setInverse <- function(inv) inverse <<- inv
    getInverse <- function() inverse
    
    # returns the list of "methods" for this object
    list(set=set, get=get, setInverse=setInverse, getInverse=getInverse)
}


## this function tries to retrieve the cached "solve"(inverse) for a given matrix
## if there is no cache, then it calculates the solve and updates the cache
## finally, it returns the inverse matrix

cacheSolve <- function(x, ...) {
    inverse <- x$getInverse()
    # if the getter doesn't return null...
    if(!is.null(inverse)) {
        # ... return the cached data
        return(inverse)
    }
    # otherwise, we calculate it
    data <- x$get()
    
    # see ?solve, it returns the inverse of matrix a, if a second parameter is missing
    inverse <- solve(A)
    
    # update the cache
    x$setInverse(inverse)
    
    # then return
    inverse
}
