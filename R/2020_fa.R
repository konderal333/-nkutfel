library("readxl")
library(dplyr)
library(tidyverse)
library(rpart)
library(caret)
library(rpart.plot)
library("class")
library("e1071")

my_data_2020 = read_excel("C:/Users/kolle/OneDrive/Dokumentumok/GitHub/-nkutfel/�ltk�mes zh n�lk�li 2020.xlsx")

names(my_data_2020)[names(my_data_2020) == "�lt.k�m pontsz�m"] <- "k�miapont"
colnames(my_data_2020) <- make.names(colnames(my_data_2020))

#relev�ns oszlopok kiv�laszt�sa, illetve faktoriz�ci�
kemdata = my_data_2020[, c(-1,-2,-8,-10,-17,-24,-25)]

kemdata$Szak = as.factor(kemdata$Szak)
kemdata$X12_ora_tipus = as.factor(kemdata$X12_ora_tipus)
kemdata$Tank�r = as.factor(kemdata$Tank�r)
kemdata$Sz�let�si.d�tum = as.Date(kemdata$Sz�let�si.d�tum, "%Y-%m-%d")
kemdata$Tanulm�nyi.pont = as.numeric(kemdata$Tanulm�nyi.pont)
kemdata$�retts�gi.pont = as.numeric(kemdata$�retts�gi.pont)
kemdata$T�bbletpont = as.numeric(kemdata$T�bbletpont)
#kemdata$jegy = sapply(kemdata$jegy, function(n){n%/%4})
kemdata = kemdata[, c(-6)]

set.seed(20)
ind <- sample(2, nrow(kemdata), replace=TRUE, prob=c(0.70, 0.30))

data.training = kemdata[ind==1, ]
data.test = kemdata[ind==2, ]


altkemtree <- rpart( jegy ~ ., data = data.training, method = "class")
rpart.plot(altkemtree)






