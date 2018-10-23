# getZpos.r
# written by JuG
# Thu Nov 30 15:43:19 2017


#' Get Z position in micrometer
#' @author JuG
#' @description Get Z position in micrometer
#' @param path  Path to the .txt or .gz metadata file
#' @return Z position (vector) of images
#' @export
#'
#'

getZpos<-function (path)
  # function to extract position of the frame
  # @ path: path to metadata file
{
  con <- file(path)
  b <- readLines(con)
  n1 <- grep("ZPositionUm",b)
  doo <- as.numeric(gsub(",","",gsub("  \"ZPositionUm\": ","",b[n1])))
  close(con)
  return(doo)
}
