

#Function for adding RBD location code (locCode) to a dataframe based on FST location codes - output name can be specified
#- input is a dataframe (df) with a variable containing FST location code (FSTLocCode) and a optional varibale output name (output_var_name),
#default = harbour

FSTLocCode_to_RDB_locCode <- function(df, FSTLocCode, output_var_name = harbour) {

  library(dplyr)
  library(stringr)

  FSTLocCode <- enquo(FSTLocCode)
  output_var_name <- enquo(output_var_name)

  l_FSTLocCodes <- mutate(l_FSTLocCodes, !! paste0(quo_name(FSTLocCode)) := as.character(str_pad(start, 5, pad = "0")))
  l_FSTLocCodes <- select(l_FSTLocCodes, -start)

  df <- left_join(df, l_FSTLocCodes)
  df <- rename(df, !! paste0(quo_name(output_var_name)) := harbourEU)

  df

}


test <- FSTLocCode_to_RDB_locCode(dfad[1:20,], lplads, output_var_name = landLoc)
FSTLocCode <- lplads
