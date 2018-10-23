#
# written by JuG
# Thu Nov 30 15:43:19 2017


#' Return photons from ADU
#' @author JuG
#' @description Compute signal in photons from camera ADU. Set for Hamamatsu cam ImagEM.
#' @param EMGain EM gain from the camera
#' @export

aduToPhotons <- function(EMGain){
  return(round(EMGain * .90 /5.8))
}
