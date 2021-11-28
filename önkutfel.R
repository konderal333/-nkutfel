library("readxl")
library(dplyr)
library(tidyverse)

#beolvasás és mergelés
my_data_2021 <- read_excel("C:/Users/kolle/OneDrive/Dokumentumok/GitHub/-nkutfel/data_2021_merged_clean.xlsx")
zh0_2021 <- read_excel("C:/Users/kolle/Downloads/VBK_ZH0_eredmenyek_210917.xlsx")
felvpont_2021 <- read_excel("C:/Users/kolle/Downloads/Felvettek 2021A.xlsx")

merged_2021_elso = inner_join(my_data_2021, zh0_2021, by = c("Name" = "Név"))
merged_2021 = inner_join(merged_2021_elso, felvpont_2021, by = c("Name" = "Név") )

merged_2021 = merged_2021[, c(-36,-37,-38,-39,-40)]                                     
merged_2021 = merged_2021[, c(-26,-28,-29,-30,-35)]  
merged_2021 = merged_2021[, c(-22,-23,-24,-25)]
merged_2021 = merged_2021[, c(-10)] 

#faktorizáljuk a kategorikus változókat
merged_2021$Szak = as.factor(merged_2021$Szak)
merged_2021$`12_ora_tipus` = as.factor(merged_2021$`12_ora_tipus`)

#binárissá, amit érdemes
merged_2021 <- merged_2021 %>%
  mutate(Mat_term_tag = recode(Mat_term_tag, "Igen" = 1, "Nem" = 0),
         Emelt = recode(Emelt, "Igen" = 1, "Nem" = 0))


library(writexl)
write_xlsx(merged_2021,"C:/Users/kolle/OneDrive/Dokumentumok/GitHub/-nkutfel/2021_merged_with_zh_clean.xlsx")


r2 <- function(x,y){ cor(x, y)^2 }
r2(merged_2021$ZH0,merged_2021$`Matek eredmény`)




#2019-es adatok

my_data_2019 <- read_excel("C:/Users/kolle/OneDrive/Dokumentumok/GitHub/-nkutfel/data_2019_cleaned.xlsx")
zh0_2019 <- read_excel("C:/Users/kolle/Downloads/VBK_matematika_nulladik_zh_2019-09-13.xlsx")
felvpont_2019 <- read_excel("C:/Users/kolle/Downloads/Felvettek listája 2019A.xlsx")


merged_2019_elso = inner_join(my_data_2019, zh0_2019, by = c("Name" = "Név"))
merged_2019 = inner_join(merged_2019_elso, felvpont_2019, by = c("Name" = "Név"))
merged_2019 = merged_2019[, c(-12,-13,-14,-15)] #elsõ táblából való felesleges attribútumok kiszûrése       
merged_2019 = merged_2019[, c(-13,-14,-20,-21,-22,-23,-24)]
merged_2019 = merged_2019[, c(-16)]

#faktorizáljuk a kategorikus változókat
merged_2019$Szak = as.factor(merged_2019$Szak)

#binárissá, amit érdemes
merged_2019 <- merged_2019 %>%
  mutate(Mat_term_tag = recode(Mat_term_tag, "Igen" = 1, "Nem" = 0),
         Emelt = recode(Emelt, "Igen" = 1, "Nem" = 0))


write_xlsx(merged_2019,"C:/Users/kolle/OneDrive/Dokumentumok/GitHub/-nkutfel/2019_merged_with_zh_clean.xlsx")




#2020-as adatok
my_data_2020 <- read_excel("C:/Users/kolle/OneDrive/Dokumentumok/GitHub/-nkutfel/data_2020_cleaned.xlsx")
felvpont_2020 <- read_excel("C:/Users/kolle/Downloads/Felvettek 2020A.xlsx")

merged_2020 <- inner_join(my_data_2020, felvpont_2020, by = c("Name" = "Név"))

merged_2020 = merged_2020[, c(-27,-28,-29,-30,-31)]  
merged_2020 = merged_2020[, c(-21,-25)]

#faktorizáljuk a kategorikus változókat
merged_2020$Szak = as.factor(merged_2020$Szak)
merged_2020$`12_ora_tipus` = as.factor(merged_2020$`12_ora_tipus`)

#binárissá, amit érdemes
merged_2020 <- merged_2020 %>%
  mutate(Mat_term_tag = recode(Mat_term_tag, "Igen" = 1, "Nem" = 0),
         Emelt = recode(Emelt, "Igen" = 1, "Nem" = 0),
         TEHETSÉGGONDOZÓ = recode(TEHETSÉGGONDOZÓ, "IGEN" = 1, "NEM" = 0),
         FELZÁRKÓZÁS = recode(FELZÁRKÓZÁS, "IGEN" = 1, "NEM" = 0))

write_xlsx(merged_2020,"C:/Users/kolle/OneDrive/Dokumentumok/GitHub/-nkutfel/2020_merged_with_zh_clean.xlsx")
