# getDcamExposure
# written by JuG
# Thu Nov 30 15:43:19 2017


#' Get DCAM Exposure
#' @author JuG
#' @description Get DCAM Exposure - expressed in msec
#' @param path  Path to the .txt or .gz metadata file
#' @return DCAM exposure in ms
#' @export


getDcamExposure <- function(path){
  # function to extract DCAM exposure time
  # @ path: path to metadata file
  con <- file(path)
  b <- readLines(con)
  n1 <- grep('DCAM-Exposure',b)
  close(con)
  #as.numeric(gsub(",","",gsub("  \"ElapsedTime-ms\": ","",b[n1])))
  az <- read.table(path,skip=n1[1]-1,nrows=1)
  if( grep('DCAM-Exposure',az$V1)==1){
    return(az$V3/1000)
  }else{
    #if( grep('EMGain',az$V1)!=1){
    cat("Pas de valeur de DCAM-Exposure")
  }
}
