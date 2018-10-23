# getExposure.r
# written by JuG
# Thu Nov 30 15:43:19 2017


#' Get Exposure time in ms
#' @author JuG
#' @description Get Exposure time in ms
#' @param path  Path to the .txt or .gz metadata file
#' @return Exposure time in ms
#' @export

getExposure <- function(path){
  return(getMetaGeneric(path, "Exposure-ms", type = "n"))
}
