

Update_code_lists <- function() {

  library(stringr)

  #location codes from FST, Denmark

  lplads <- read.csv("Q:/mynd/SAS Library/Lplads/lplads.csv", header = T, sep = ",")
  lplads$start <- as.character(str_pad(lplads$start, 5, pad = "0"))
  l_FSTLocCodes <- lplads[, c("start", "harbourEU", "nationl")]
  devtools::use_data(l_FSTLocCodes, overwrite = T, internal = TRUE)
  devtools::use_data(l_FSTLocCodes, overwrite = T, internal = FALSE)

 }


Update_code_lists()
