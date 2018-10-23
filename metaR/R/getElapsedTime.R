# getElapsedTime.r
# written by JuG
# Thu Nov 30 15:43:19 2017


#' Function to extract elapsed time (in msec)
#' @author JuG
#' @description Get elapsed time in ms between consecutive frames
#' @param path  Path to the .txt or .gz metadata file
#' @return Elapsed time (vector) in msec
#' @export
#'
#'
getElapsedTime <- function (path)
  # function to extract elapsed time exposure time
  # @ path: path to metadata file
{
  con <- file(path)
  b <- readLines(con)
  n1 <- grep("ElapsedTime",b)
  doo <- as.numeric(gsub(",","",gsub("  \"ElapsedTime-ms\": ","",b[n1])))
  doo2 <- doo[-1]
  doo <- doo2 - doo[-length(doo)]
  close(con)
  return(doo)
}
