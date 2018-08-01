

#Function for adding RBD location code (locCode) to a dataframe based on FST location codes - output name can be specified
#- input is a dataframe (df) with a variable containing FST location code (FSTLocCode) and a optional varibale output name (output_loc_var),
#default = harbour

nat_locode_to_RDB_locode <- function(df, type = "FST", locode, output_loc_var = harbour, ctry = TRUE, output_ctry_var = ctry) {

  library(dplyr)
  library(stringr)
  library(rlang)

  locode <- enquo(locode)
  output_loc_var <- enquo(output_loc_var)
  output_ctry_var <- enquo(output_ctry_var)

  if (type == "FST") {

    if (ctry == FALSE) {

      code <- mutate(l_FSTLocCodes, !! paste0(quo_name(locode)) := as.character(str_pad(start, 5, pad = "0")))
      code <- select(code, -start, -nationl)

      df <- left_join(df, code)
      df <- rename(df, !! paste0(quo_name(output_loc_var)) := harbourEU)

    } else {

      code <- mutate(l_FSTLocCodes, !! paste0(quo_name(locode)) := as.character(str_pad(start, 5, pad = "0")))
      code <- select(code, -start)

      df <- left_join(df, code)
      df <- rename(df, !! paste0(quo_name(output_loc_var)) := harbourEU, !! paste0(quo_name(output_ctry_var)) := nationl)

    }
  }

  df

}


#test <- nat_locode_to_RDB_locode(dfad, type = "FST", lplads, output_loc_var = landLoc, ctry = T, output_ctry_var = landCtry)
# FSTLocCode <- lplads
