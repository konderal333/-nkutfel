#összerakjuk az eddigi merget a matekeredményekkel
library("readxl")
library(dplyr)
library(tidyverse)

matek_2019 <- read_excel("C:/Users/Donát/Documents/GitHub/-nkutfel/2019_matekjegyek_tisztított.xlsx")
eddigi_2019 <- read_excel("C:/Users/Donát/Documents/GitHub/-nkutfel/2019_merged_with_zh_clean.xlsx")
matekblokkos_2019 <- read_excel("C:/Users/Donát/Downloads/BME-VBK-Felmero-2019_EREDMENYEK.xlsx")

matekblokkos_2019 = matekblokkos_2019[, c(2,8,9,10)]

data2 = inner_join(eddigi_2019, matek_2019, by = c("Name" = "Nyomtatási név"))
data = inner_join(data2, matekblokkos_2019, by = c("Name" = "név"))

#rendezzük az oszlopokat
data = data[, c(1:6, 19, 20, 21, 7:18)]

library(writexl)
write_xlsx(data,"C:/Users/Donát/Documents/GitHub/-nkutfel/2019/2019_merged_matekA1A2_cleaned.xlsx")
