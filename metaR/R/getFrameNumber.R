# getFrameNumber.r
# written by JuG
# Thu Nov 30 15:43:19 2017


#' Get the total number of frames
#' @author JuG
#' @description Get frame number
#' @param path  Path to the .txt or .gz metadata file
#' @return EMGain value
#' @export

getFrameNumber <- function(path){
  con <- file(path)
  b <- readLines(con)
  n1 <- grep('FrameIndex',b)
  close(con)
  az <- read.table(path,skip=tail(n1, 1)-1,nrows=1)
  if( grep('FrameIndex',az$V1)==1){
    return(as.numeric(gsub(",","",az$V3))+1)
  }else{
    #if( grep('EMGain',az$V1)!=1){
    cat("Not found")
    return()
  }
}
