library("ggplot2")

data <- read.csv("C:/Users/Donát/Documents/GitHub/-nkutfel/2019_visual.csv")
data = data[, -1]

ggplot(data, aes(x=reorder(Algorithm, Accuracy), y=Accuracy, fill = Model)) + geom_bar(stat='identity') + coord_flip() + xlab(label = "Algorithms")
