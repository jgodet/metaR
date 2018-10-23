# getXpos.r
# written by JuG
# Thu Nov 30 15:43:19 2017


#' Function to extract X position in micrometer
#' @author JuG
#' @description Get X position in micrometer
#' @param path  Path to the .txt or .gz metadata file
#' @return X position (vector) of images
#' @export
#'
#'


getXpos<-function (path)
  # function to extract position of the frame
  # @ path: path to metadata file
{
  con <- file(path)
  b <- readLines(con)
  n1 <- grep("XPositionUm",b)
  doo <- as.numeric(gsub(",","",gsub("  \"XPositionUm\": ","",b[n1])))
  close(con)
  return(doo)
}
