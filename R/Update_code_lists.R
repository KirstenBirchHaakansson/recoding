

Update_code_lists <- function() {

  require(stringr)
  require(haven)

  #location codes for FST, Denmark

  lplads <- read.csv("Q:/mynd/SAS Library/Lplads/lplads.csv", header = T, sep = ",")
  lplads$start <- as.character(str_pad(lplads$start, 5, pad = "0"))
  l_FST_loc_codes <- lplads[, c("start", "harbourEU", "nationl")]
  devtools::use_data(l_FST_loc_codes, overwrite = T, internal = FALSE)

  #Area codes for FST, Denmark

  areas <- read_sas("Q:/mynd/SAS Library/Farvand/farvand.sas7bdat")
  l_FST_areas_codes <- areas[, c("start", "faoArea", "icesArea", "rdbAreaOld")]
  devtools::use_data(l_FST_areas_codes, overwrite = T, internal = FALSE)

  #Species codes for FST, Denmark
  species <- read_sas("Q:/mynd/SAS Library/Arter/art.sas7bdat")
  l_FST_species_codes <- species[, c("wormsLatin", "start", "art", "X_A_CODE", "SSOAPAphiaId", "ISSCAAP")]
  devtools::use_data(l_FST_species_codes, overwrite = T, internal = FALSE)

 }


#Update_code_lists()
