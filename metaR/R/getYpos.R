# getYpos.r
# written by JuG
# Thu Nov 30 15:43:19 2017


#' Function to extract Y position in micrometer
#' @author JuG
#' @description Get Y position in micrometer
#' @param path  Path to the .txt or .gz metadata file
#' @return Y position (vector) of images
#' @export
#'
#'

getYpos<-function (path)
  # function to extract position of the frame
  # @ path: path to metadata file
{
  con <- file(path)
  b <- readLines(con)
  n1 <- grep("YPositionUm",b)
  doo <- as.numeric(gsub(",","",gsub("  \"YPositionUm\": ","",b[n1])))
  close(con)
  return(doo)
}
