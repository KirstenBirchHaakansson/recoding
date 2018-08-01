

Update_code_lists <- function() {

  #location codes from FST, Denmark

  lplads <- read.csv("Q:/mynd/SAS Library/Lplads/lplads.csv", header = T, sep = ",")
  l_FSTLocCodes <- lplads[, c("start", "harbourEU", "nationl")]
  devtools::use_data(l_FSTLocCodes, overwrite = T)

 }


#Update_code_lists()
