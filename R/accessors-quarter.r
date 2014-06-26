#' @include accessors-month.r
NULL

#' Get the fiscal quarter of a date-time.
#'
#' Fiscal quarters are a way of dividing the year into fourths. The first quarter (Q1) 
#' comprises January, February and March; the second quarter (Q2) comprises April, May, 
#' June; the third quarter (Q3) comprises July, August, September; the fourth quarter (Q4)
#' October, November, December.
#'
#' @param x a date-time object of class POSIXct, POSIXlt, Date, chron, yearmon, yearqtr, zoo, 
#' zooreg, timeDate, xts, its, ti, jul, timeSeries, fts or anything else that can be converted 
#' with as.POSIXlt
#' @param with_year logical indicating whether or not to include they quarter's year.
#' @keywords utilities manip chron methods
#' @return numeric the fiscal quarter that the date-time occurs in
#' @examples
#' x <- ymd(c("2012-03-26", "2012-05-04", "2012-09-23", "2012-12-31"))
#' quarter(x)
#' # 1 2 3 4
#' quarter(x, with_year = TRUE)
#' # 2012.1 2012.2 2012.3 2012.4
#' @export
quarter <- function(x, with_year = FALSE) {
  m <- month(x)
  quarters <- c("1" = 1L, 
                "2" = 1L, 
                "3" = 1L, 
                "4" = 2L, 
                "5" = 2L, 
                "6" = 2L, 
                "7" = 3L, 
                "8" = 3L, 
                "9" = 3L, 
                "10" = 4L, 
                "11" = 4L, 
                "12" = 4L)
  if (isTRUE(with_year)){
    q <- unname(quarters[m])
    y <- year(x)
    as.numeric(paste0(y, ".", q))
  } else unname(quarters[m])
}
