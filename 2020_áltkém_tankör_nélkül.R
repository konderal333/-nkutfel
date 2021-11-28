library("readxl")
library(dplyr)
library(tidyverse)
library(rpart)
library(caret)
library(rpart.plot)
library("class")

my_data_2020 = read_excel("C:/Users/kolle/OneDrive/Dokumentumok/GitHub/-nkutfel/Áltkémes zh nélküli 2020.xlsx")

names(my_data_2020)[names(my_data_2020) == "Ált.kém pontszám"] <- "kémiapont"
colnames(my_data_2020) <- make.names(colnames(my_data_2020))

#releváns oszlopok kiválasztása, illetve faktorizáció
kemdata = my_data_2020[, c(-1,-2,-5,-8,-10,-17,-24,-25)]

kemdata$Szak = as.factor(kemdata$Szak)
kemdata$X12_ora_tipus = as.factor(kemdata$X12_ora_tipus)
kemdata$Születési.dátum = as.Date(kemdata$Születési.dátum, "%Y-%m-%d")
kemdata$Tanulmányi.pont = as.numeric(kemdata$Tanulmányi.pont)
kemdata$Érettségi.pont = as.numeric(kemdata$Érettségi.pont)
kemdata$Többletpont = as.numeric(kemdata$Többletpont)
#kemdata$jegy = sapply(kemdata$jegy, function(n){n%/%4})
kemdata = kemdata[, c(-5)]

set.seed(20)
ind <- sample(2, nrow(kemdata), replace=TRUE, prob=c(0.70, 0.30))

data.training = kemdata[ind==1, ]
data.test = kemdata[ind==2, ]


altkemtree <- rpart( jegy ~ ., data = data.training, method = "class")
rpart.plot(altkemtree)
