## Two functions - one to cache the matrix
## the second to read the cached inverse (if available) or calculate inverse
makeCacheMatrix <- function(x = matrix()) {
  m<- NULL
  set <-function(y) {
    x<<-y
    m<-NULL
  }
  get<-function() x
  setinv<-function(solve) m<<-solve
  getinv<-function() m
  list(set=set,get=get,
       setinv=setinv,
       getinv=getinv)
}

## Read the cache of inverses or calculate the inverse using solve(x)
## Return a matrix that is the inverse of 'x'
cacheSolve <- function(x, ...) {
  m<-x$getinv()
  if(!is.null(m)){
    message("getting cached data")
    return(e)
  }
  data<-x$get()
  m<-solve(data,...)
  x$setinv(e)
  m
}
