#' @include periods.r
NULL

#' Get/set minutes component of a date-time.
#'
#' Date-time must be a  POSIXct, POSIXlt, Date, Period, chron, yearmon, yearqtr, zoo, 
#' zooreg, timeDate, xts, its, ti, jul, timeSeries, and fts objects. 
#'
#' @export minute "minute<-"
#' @aliases minute minute<-
#' @S3method minute default
#' @S3method minute Period
#' @param x a date-time object   
#' @keywords utilities manip chron methods
#' @return the minutes element of x as an integer
#' @examples
#' x <- ymd("2012-03-26")
#' minute(x)
#' minute(x) <- 1
#' minute(x) <- 61 
#' minute(x) > 2
minute <- function(x) 
  UseMethod("minute")
  
minute.default <- function(x)
  as.integer(as.POSIXlt(x, tz = tz(x))$min)

minute.Period <- function(x)
  slot(x, "minute")

"minute<-" <- function(x, value)
  x <- x + minutes(value - minute(x))

setGeneric("minute<-")

#' @export
setMethod("minute<-", signature("Period"), function(x, value){
  slot(x, "minute") <- value
  x
})
