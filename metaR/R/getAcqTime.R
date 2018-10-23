# getAcqTime.r
# written by JuG
# Thu Nov 30 15:43:19 2017


#' Get Acquisition time  - POSIXct object
#' @author JuG
#' @description Get Acquisition time
#' @param path  Path to the .txt or .gz metadata file
#' @return Acquisition time (POSIXct object)
#' @export

getAcqTime <- function(path){
  return(getMetaGeneric(path, "Time", type = "t"))
}
