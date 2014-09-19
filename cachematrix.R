## Matrix calculations can be expensive to compute and hence, these functions try to store the results of matrix inversion,
## and the original matrix in the cache.
## Thus , when these parameters are set, user can be able to get them back from the cache by using the get functions.
## This would save computational cost.



## MakeCacheMatrix function accepts matrix arguments and returns a list of functions that can be used to 
## a) SET the value of the matrix
## b) GET the value of the matrix
## c) SET the inverse of the matrix to the matrix passed to the function and store it in cache
## d) GET the inverse of the special matrix object from the cache.

## the function returns a list of functions as described above.

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y = matrix()) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(inv = matrix()) m <<- inv
        getinverse <- function() m
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}

## Retreives m by getinverse from the functions present in the special object passed,
## If m is not null, that means inverse is already present in cache and need not be calculated again and hence,
## returned by using getinverse method
## If inverse not present in cache, use solve function to calculate the inverse,
## Then , store it in the cache
## Then , return the inverse that was calculated.

cacheSolve <- function(x, ...) {
        m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
	data <- matrix()
        data <- x$get()
        m <- solve(data)
        x$setinverse(m)
        m
}
