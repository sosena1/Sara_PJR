#Sara Rupacz - projekt PJR

getwd()
setwd("C:/Users/Sosna/Desktop/PJR Sara/Sara_PJR/")

library(fivethirtyeight)

x <- fivethirtyeight::comic_characters
write.csv(x, file = "./NotProcessedData.csv")

