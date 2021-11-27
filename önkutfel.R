library("readxl")
library(dplyr)
library(tidyverse)

#beolvasás és mergelés
my_data_eredeti <- read_excel("C:/Users/Donát/Documents/GitHub/-nkutfel/data_2021_merged_clean.xlsx")
zh0_2021 <- read_excel("C:/Users/Donát/Desktop/önkutfel/VBK_ZH0_eredmenyek_210917.xlsx")

merged_2021 = inner_join(my_data_eredeti, zh0_2021, by = c("Name" = "Név"))
merged_2021 = merged_2021[, c(-22,-23,-24,-25)]                                     #redundás vagy irreleváns oszlopok kiszedése

#faktorizáljuk a kategorikus változókat
merged_2021$Szak = as.factor(merged_2021$Szak)
merged_2021$`12_ora_tipus` = as.factor(merged_2021$`12_ora_tipus`)

#binárissá, amit érdemes
merged_2021 <- merged_2021 %>%
  mutate(Mat_term_tag = recode(Mat_term_tag, "Igen" = 1, "Nem" = 0),
         Emelt = recode(Emelt, "Igen" = 1, "Nem" = 0))


library(writexl)
write_xlsx(merged_2021,"C:/Users/Donát/Documents/GitHub/-nkutfel/2021_merged_with_zh_clean.xlsx")


r2 <- function(x,y){ cor(x, y)^2}
r2(merged_2021$ZH0,merged_2021$`Matek eredmény`)
