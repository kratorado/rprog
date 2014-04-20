## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

# This function is to make a "specail matrix", which is 
# really a list containing functions to set/get the value 
# of the matrix and set/get the value of the inverse of 
# the matrix
makeCacheMatrix <- function(x = matrix()) {
    slv <- NULL
    set <- function(y) {
        x <<- y
        slv <<- NULL
    }
    get <- function() {x}
    set_solve <- function(solve) {
        slv <<- solve
    }
    get_solve <- function() {slv}
    list(set = set, get = get, set_solve = set_solve, get_solve = get_solve)
}


## Write a short comment describing this function
# This function is to get and cache the inverse of the 
# given "matrix" object
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    s <- x$get_solve()
    if (!is.null(s)) {
        message("getting cached data")
        return (s)
    }
    data <- x$get()
    s <- solve(data, ...)
    x$set_solve(s)
    s
}
