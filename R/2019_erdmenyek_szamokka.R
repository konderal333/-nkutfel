# 2019 matek eredmények javítás

library("readxl")
library(dplyr)
library(tidyverse)

matek_2019 <- read_excel("C:/Users/Donát/Downloads/VBK19_hallgatok_MatA1-A2_eredmenyek.xlsx") 

matek_2019 <- matek_2019 %>%
  mutate(`Bejegyzés értéke` = recode(`Bejegyzés értéke`,
                                   "Elégtelen" = 1,
                                   "Elégséges" = 2,
                                   "Közepes" = 3,
                                   "Jó" = 4,
                                   "Jeles" = 5))


library(writexl)
write_xlsx(matek_2019,"C:/Users/Donát/Documents/GitHub/-nkutfel/2019_matek_A1_A2")
