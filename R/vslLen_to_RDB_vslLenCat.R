
#Function for adding RBD vessel length categories (vslLenCat) to a dataframe
#- input is a dataframe (df) with a variable containing vessel length in meters (vslLen) - the latter should be numeric

vslLen_to_RDB_vslLenCat <- function(df, vslLen){

  library(dplyr)

  vslLen <- enquo(vslLen)

  df <- mutate(df, vslLenCat = ifelse(!!vslLen >= 0 & !!vslLen < 10, "<10",
                                           ifelse(!!vslLen >= 10 & !!vslLen < 12, "10-<12",
                                                  ifelse(!!vslLen >= 12 & !!vslLen < 18, "12-<18",
                                                         ifelse(!!vslLen >= 18 & !!vslLen < 24, "18-<24",
                                                                ifelse(!!vslLen >= 24 & !!vslLen < 40, "24-<40",
                                                                       ifelse(!!vslLen >= 40, ">40", NA)))))))
  df
}

