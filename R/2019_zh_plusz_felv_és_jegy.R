library("readxl")
library(dplyr)
library(tidyverse)

matek_2019_felveteli <- read_excel("C:/Users/Don�t/Documents/GitHub/-nkutfel/nyers_data/Felvettek list�ja 2019A.xlsx")
matek_2019_zh <- read_excel("C:/Users/Don�t/Documents/GitHub/-nkutfel/nyers_data/VBK_matematika_nulladik_zh_2019-09-13.xlsx")
matek_jegyek <- read_excel("C:/Users/Don�t/Documents/GitHub/-nkutfel/2019/2019_matekjegyek_tiszt�tott.xlsx")


matek_egyesitett = inner_join(matek_2019_felveteli, matek_2019_zh)
matek_final = inner_join(matek_egyesitett, matek_jegyek, by = c("N�v" = "Nyomtat�si n�v"))

#nem fontos oszlopokat szedj�k ki
matek_final = matek_final[, c(seq(1,8),15,18,19,20)]

#sz�rj�k ki azokat a sorokat, amelyekn�l nincs zh eredm�ny
matek_final = subset(matek_final, ZH0 != "�")

#export�l�s
library(writexl)
write_xlsx(matek_final,"C:/Users/Don�t/Documents/GitHub/-nkutfel/2019/2019_zh_felv_jegy_only.xlsx")