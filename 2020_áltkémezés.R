library("readxl")
library(dplyr)
library(tidyverse)
library(writexl)

altkem_2020_bio = read_excel("C:/Users/kolle/Downloads/Bev¡ltKÈm_¡ltKÈmGyak2020.xlsx", sheet = 3)
altkem_2020_vegyesz = read_excel("C:/Users/kolle/Downloads/Bev¡ltKÈm_¡ltKÈmGyak2020.xlsx", sheet = 4)
merged_2020 = read_excel("C:/Users/kolle/OneDrive/Dokumentumok/GitHub/-nkutfel/2020_merged_without_zh_clean.xlsx")

altkem_2020_vegyesz = altkem_2020_vegyesz[, c(1,7,8)]


altkem_2020_bio = altkem_2020_bio[, c(1,7,8)]
altkem_2020 = rbind(altkem_2020_bio, altkem_2020_vegyesz)
  
merged_2020_with_altkem = inner_join(merged_2020, altkem_2020, by = c("Name" = "HallgatÛ nyomtat·si neve"))

names(merged_2020_with_altkem)[names(merged_2020_with_altkem) == "pontsz·m"] <- "¡lt.kÈm pontsz·m"

write_xlsx(merged_2020_with_altkem,"C:/Users/kolle/OneDrive/Dokumentumok/GitHub/-nkutfel/¡ltkÈmes zh nÈlk¸li 2020.xlsx")
