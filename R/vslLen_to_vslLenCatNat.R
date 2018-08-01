
#Function for adding national vessel length categories (vslLenCatNat) to a dataframe
#- input is a dataframe (df) with a variable containing vessel length in meters (vslLen) - the latter should be numeric

vslLen_to_vslLenCatNat <- function(df, vslLen) {

  library(dplyr)

  vslLen <- enquo(vslLen)

  df <- mutate(df, vslLenCatNat = ifelse(!!vslLen >= 0 & !!vslLen < 8, "<8",
                                              ifelse(!!vslLen >= 8 & !!vslLen < 10, "8-<10",
                                                     ifelse(!!vslLen >= 10 & !!vslLen < 12, "10-<12",
                                                            ifelse(!!vslLen >= 12 & !!vslLen < 15, "12-<15",
                                                                   ifelse(!!vslLen >= 15 & !!vslLen < 18, "15-<18",
                                                                          ifelse(!!vslLen >= 18 & !!vslLen < 24, "18-<24",
                                                                                 ifelse(!!vslLen >= 24 & !!vslLen < 40, "24-<40",
                                                                                        ifelse(!!vslLen > 40, ">40", NA)))))))))
  df
}
