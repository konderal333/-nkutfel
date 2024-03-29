#�sszerakjuk az eddigi merget a matekeredm�nyekkel
library("readxl")
library(dplyr)
library(tidyverse)

matek_2019 <- read_excel("C:/Users/Don�t/Documents/GitHub/-nkutfel/2019_matekjegyek_tiszt�tott.xlsx")
eddigi_2019 <- read_excel("C:/Users/Don�t/Documents/GitHub/-nkutfel/2019_merged_with_zh_clean.xlsx")
matekblokkos_2019 <- read_excel("C:/Users/Don�t/Downloads/BME-VBK-Felmero-2019_EREDMENYEK.xlsx")

matekblokkos_2019 = matekblokkos_2019[, c(2,8,9,10)]

data2 = inner_join(eddigi_2019, matek_2019, by = c("Name" = "Nyomtat�si n�v"))
data = inner_join(data2, matekblokkos_2019, by = c("Name" = "n�v"))

#rendezz�k az oszlopokat
data = data[, c(1:6, 19, 20, 21, 7:18)]

library(writexl)
write_xlsx(data,"C:/Users/Don�t/Documents/GitHub/-nkutfel/2019/2019_merged_matekA1A2_cleaned.xlsx")
