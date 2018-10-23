# getImageWidth.r
# written by JuG
# Thu Nov 30 15:43:19 2017


#' Get Image Width
#' @author JuG
#' @description Get image width - expressed in pixels
#' @param path  Path to the .txt or .gz metadata file
#' @return Image width in px
#' @export

getImageWidth <- function(path){
  # @ path: path to metadata file
  con <- file(path)
  b <- readLines(con)
  n1 <- grep('Width',b)
  close(con)
  #as.numeric(gsub(",","",gsub("  \"ElapsedTime-ms\": ","",b[n1])))
  az <- read.table(path,skip=n1[1]-1,nrows=1)
  if( grep('Width',az$V1)==1){
    az$V3<- gsub(az$V3,pattern=",",replace="")
    return(as.numeric(az$V3))
  }else{
    #if( grep('EMGain',az$V1)!=1){
    cat("Pas de valeur")
  }
}
