library("readxl")
library(dplyr)
library(tidyverse)

matek_2019_felveteli <- read_excel("C:/Users/Donát/Documents/GitHub/-nkutfel/nyers_data/Felvettek listája 2019A.xlsx")
matek_2019_zh <- read_excel("C:/Users/Donát/Documents/GitHub/-nkutfel/nyers_data/VBK_matematika_nulladik_zh_2019-09-13.xlsx")
matek_jegyek <- read_excel("C:/Users/Donát/Documents/GitHub/-nkutfel/2019/2019_matekjegyek_tisztított.xlsx")


matek_egyesitett = inner_join(matek_2019_felveteli, matek_2019_zh)
matek_final = inner_join(matek_egyesitett, matek_jegyek, by = c("Név" = "Nyomtatási név"))

#nem fontos oszlopokat szedjük ki
matek_final = matek_final[, c(seq(1,8),15,18,19,20)]

#szúrjük ki azokat a sorokat, amelyeknél nincs zh eredmény
matek_final = subset(matek_final, ZH0 != "–")

#exportálás
library(writexl)
write_xlsx(matek_final,"C:/Users/Donát/Documents/GitHub/-nkutfel/2019/2019_zh_felv_jegy_only.xlsx")