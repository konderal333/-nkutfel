# 2019 matek eredm�nyek jav�t�s

library("readxl")
library(dplyr)
library(tidyverse)

matek_2019 <- read_excel("C:/Users/Don�t/Downloads/VBK19_hallgatok_MatA1-A2_eredmenyek.xlsx") 

matek_2019 <- matek_2019 %>%
  mutate(`Bejegyz�s �rt�ke` = recode(`Bejegyz�s �rt�ke`,
                                   "El�gtelen" = 1,
                                   "El�gs�ges" = 2,
                                   "K�zepes" = 3,
                                   "J�" = 4,
                                   "Jeles" = 5))


library(writexl)
write_xlsx(matek_2019,"C:/Users/Don�t/Documents/GitHub/-nkutfel/2019_matek_A1_A2")
