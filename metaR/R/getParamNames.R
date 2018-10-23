# getParamNames.r
# written by JuG
# Tue Dec  5 09:01:08 2017


#' Get Metadata parameters names
#' @author JuG
#' @description Get metadata parameters names
#' @param path  Path to the .txt or .gz metadata file
#' @return Metadata parameters names
#' @export

getParamNames <- function(path){
  con <- file(path)
  b <- readLines(con)
  n1 <- grep('FrameKey',b)
  close(con)
  #as.numeric(gsub(",","",gsub("  \"ElapsedTime-ms\": ","",b[n1])))
  raw <- b[(n1[1]+1):(n1[2]-2)]
  sem <- sapply(strsplit(raw,split = ":"), `[`, 1)
  sem <- gsub(pattern = paste("  \""),"",sem)
  sem <- gsub(pattern = paste("\""),"",sem)
  return(sem)
}

