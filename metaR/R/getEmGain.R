# getEmGain.r
# written by JuG
# Thu Nov 30 15:43:19 2017


#' Get EM Gain
#' @author JuG
#' @description Get EM Gain
#' @param path  Path to the .txt or .gz metadata file
#' @return EMGain value
#' @export

getEmGain <- function(path){
  con <- file(path)
  b <- readLines(con)
  n1 <- grep('EMGain',b)
  close(con)
  az <- read.table(path,skip=n1[1]-1,nrows=1)
  if( grep('EMGain',az$V1)==1){
    return(az$V3)
  }else{
    #if( grep('EMGain',az$V1)!=1){
    cat("Pas de valeur d'EMGain")
  }
}
