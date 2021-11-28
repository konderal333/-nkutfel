#lineáris regresszió jegyre
library("readxl")
library(dplyr)
library(tidyverse)

my_data_2020 = read_excel("C:/Users/kolle/OneDrive/Dokumentumok/GitHub/-nkutfel/Áltkémes zh nélküli 2020 idõvel.xlsx")

names(my_data_2020)[names(my_data_2020) == "Ált.kém pontszám"] <- "kémiapont"
colnames(my_data_2020) <- make.names(colnames(my_data_2020))

#távolítsuk el a nem numerikus változókat
kemdata = my_data_2020[, c(4,5, 10:20, 22:27)]

#most a redundáns változókat távolítsuk el
kemdata = kemdata[, c(-4,-11, -17, -18)]

regression <- lm(jegy ~ ., data = kemdata)
summary(regression)


