# getMetaGeneric.r
# written by JuG
# Thu Nov 30 15:43:19 2017


#' Generic function to get a given parameter from the metadata file
#' @author JuG
#' @description Generic function to get a given parameter from the metadata file    need to define time zone using Sys.setenv(TZ='GMT') - otherwise warning message
#' @param path  Path to the .txt or .gz metadata file
#' @param parameter parameter to extract (string)
#' @param type i:integer, n:numeric, f:factor, t:time, ai:'asis'
#' @return Values of the parameter for each image
#' @examples
#' pNames <- getParamNames(path)
#' pNames[59]
#' getMetaGeneric(path, parameter = pNames[59], type = "ai")
#'
#' getMetaGeneric(path, parameter = "Time", type = "t")
#' @export
#'
#'

getMetaGeneric<-function (path, parameter = "FrameIndex",type = 'ai')
  # function to extract position of the frame
  # @ path: path to metadata file
  # need to define time zone using Sys.setenv(TZ='GMT') - otherwise warning message
{
  con <- file(path)
  b <- readLines(con)
  n1 <- grep(paste("  \"",parameter,"\": ",sep=''),b)
  close(con)

  doo <- gsub(",","",gsub(paste("  \"",parameter,"\": ",sep=''),"",b[n1]))
  doo <- gsub(paste("\""),"",doo)
  if(type == "i"){
    doo <-as.integer(doo)
  }
  if(type == "n"){
    doo <-as.numeric(doo)
  }
  if(type == "f"){
    doo <-as.factor(doo)
  }
  if(type == "t"){
    doo <-as.POSIXlt(doo, tz = "GMT")
  }
  return(doo)
}
