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
        #create a list containing the special matrix
        list(set=set,
        get=get,
        setinv=setinv,
        getinv=getinv)
}

## Return a matrix that is the inverse of the special matrix
cacheSolve <- function(x, ...) {
        m<-x$getinv()
        if(!is.null(m)){
                #To test if cache is being used..
                #message("getting cached matrix")
                return(m)
        }
        #no cached solution so call solve 
        #message("no cache available")
        #use get to access matrix
        data<-x$get()
        #use solve to find inverse and store in m
        m<-solve(data,...)
        #use setinv to add matrix and inverse to cache
        x$setinv(m)
        #return the inverse matrix m
        m
}
