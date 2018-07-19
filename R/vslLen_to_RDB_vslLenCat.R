
#vslLen_to_RDB_vslLenCat###########################################################################################################
#Function for adding RBD vessel length categories (vslLenCat) to a dataframe
#- input is a dataframe (x) with a variable containing vessel length in meters (vslLen) (y) - the latter should be numeric

vslLen_to_RDB_vslLenCat <- function(x, y){

  library(dplyr)

  y <- enquo(y)

  x <- mutate(x, vslLenCat = ifelse(is.na(!!y), "<10",
                                    ifelse(!!y >= 0 & !!y < 10, "<10",
                                           ifelse(!!y >= 10 & !!y < 12, "10-<12",
                                                  ifelse(!!y >= 12 & !!y < 18, "12-<18",
                                                         ifelse(!!y >= 18 & !!y < 24, "18-<24",
                                                                ifelse(!!y >= 24 & !!y < 40, "24-<40",
                                                                       ifelse(!!y >= 40, ">40", NA))))))))
  x
}

