#' @include periods.r
NULL

#' Get/set hours component of a date-time.
#'
#' Date-time must be a POSIXct, POSIXlt, Date, Period, chron, yearmon, yearqtr, zoo, 
#' zooreg, timeDate, xts, its, ti, jul, timeSeries, and fts objects. 
#'
#' @export hour "hour<-"
#' @aliases hour hour<-
#' @S3method hour default
#' @S3method hour Period
#' @param x a date-time object   
#' @keywords utilities manip chron methods
#' @return the hours element of x as an integer
#' @examples
#' x <- ymd("2012-03-26")
#' hour(x)
#' hour(x) <- 1
#' hour(x) <- 25 
#' hour(x) > 2
hour <- function(x) 
  UseMethod("hour")
  
hour.default <- function(x)
    as.integer(as.POSIXlt(x, tz = tz(x))$hour)

hour.Period <- function(x)
  slot(x, "hour")
    
"hour<-" <- function(x, value)
  x <- x + hours(value - hour(x))

setGeneric("hour<-")

#' @export
setMethod("hour<-", signature("Period"), function(x, value){
  slot(x, "hour") <- value
  x
})
