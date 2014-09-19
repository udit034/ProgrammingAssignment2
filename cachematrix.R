## Matrix calculations can be expensive to compute and hence, these functions try to store the results of matrix mean,
## and the original matrix in the cache.
## Thus , when these parameters are set, user can be able to get them back from the cache by using the get functions.
## This would save computational cost.



## MakeCacheMatrix function accepts matrix arguments and returns a list of functions that can be used to 
## a) SET the value of the matrix
## b) GET the value of the matrix
## c) SET the mean value of the matrix the special Matrix object created.
## d) GET the mean value of the special matrix object from the cache.

## the function returns a list of functions as described above.

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y = matrix()) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setmean <- function(mean) m <<- mean
        getmean <- function() m
        list(set = set, get = get,
             setmean = setmean,
             getmean = getmean)
}

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
