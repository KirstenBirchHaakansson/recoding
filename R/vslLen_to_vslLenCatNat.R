#vslLen_to_RDB_vslLenCatNat###################################################################################################
#Function for adding national vessel length categories (vslLenCatNat) to a dataframe
#- input is a dataframe (x) with a variable containing vessel length in meters (vslLen) (y) - the latter should be numeric

vslLen_to_RDB_vslLenCatNat <- function(x, y) {

  library(dplyr)

  y <- enquo(y)

  x <- mutate(x, vslLenCatNat = ifelse(is.na(!!y), "<8",
                                       ifelse(!!y >= 0 & !!y < 8, "<8",
                                              ifelse(!!y >= 8 & !!y < 10, "8-<10",
                                                     ifelse(!!y >= 10 & !!y < 12, "10-<12",
                                                            ifelse(!!y >= 12 & !!y < 15, "12-<15",
                                                                   ifelse(!!y >= 15 & !!y < 18, "15-<18",
                                                                          ifelse(!!y >= 18 & !!y < 24, "18-<24",
                                                                                 ifelse(!!y >= 24 & !!y < 40, "24-<40",
                                                                                        ifelse(!!y > 40, ">40", NA))))))))))
  x
}

# #Test vslLanCatNat
# dfad <- readRDS("Q:/dfad/data/Data/udvidet_data/dfad_udvidet2016.RDS")
# x <- subset(dfad, hel != 0)[, c("oal", "hel")]
# x$oal <- as.numeric(x$oal)
#
# test_vslLenCatNat <- DFAD_vslLen_to_RDB_vslLenCatNat(x, y = oal)
#
# test_vslLenCatNat_sum <- summarise(group_by(test_vslLenCatNat, oal, vslLenCatNat), hel = sum(hel))
# test_vslLenCatNat_mis <- subset(test_vslLenCatNat, is.na(vslLenCatNat))
