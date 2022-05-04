# bináris oszlopok hozzárakása
library("readxl")
library(dplyr)
library(tidyverse)

matek_2019 <- read_excel("C:/Users/Donát/Documents/GitHub/-nkutfel/2019/2019_MAIN_CLEANED.xlsx")
matekblokkos_2019 <- read_excel("C:/Users/Donát/Documents/GitHub/-nkutfel/ONKUTFEL2/NYERS_2019/BME-VBK-Felmero-2019.xlsx")

matekblokkos_2019 = matekblokkos_2019[,c(2,seq(9,57))]

data = inner_join(matek_2019, matekblokkos_2019, by = c("Name" = "név"))

library(writexl)
write_xlsx(data,"C:/Users/Donát/Documents/GitHub/-nkutfel/ONKUTFEL2/2019_hamminghez.xlsx")
